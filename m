Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8C6DFE38
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:59:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfgw-0007W7-7j; Wed, 12 Apr 2023 14:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmfgu-0007Vr-10
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:59:36 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmfgq-0005Ax-B6
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:59:34 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94a34d38291so233940666b.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681325970; x=1683917970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rfKtPIZLyI/9kyv0UlHMQW/E9H0QfT6xiEL4AwLN9MA=;
 b=mMglum5fqjfiCG7dFKCTVMDKeWjPt0TTq66CTLfgOcTIRq7JNlX+ickLCdUi669e1C
 GvykWxqeZRdVcPEBFuaLBzprxK8efJXDWK0ryJAYraZLFjAzQuTcNgihiu3y8Fx/bG4j
 0rzmVV9NZ3L9tRjU48S01OFPLBEvTA+LKl6YHEPLWriBH+1tPJgDqdYtTke4wSdh+r9C
 8DfQGztPQfD+wDrkiDMBUSf8MMat4W6chryhuxWCWg+c3wB2Gqg0GUzKQ33dI7R+UAw8
 hF6bbkEFmyJCS68UEPqY9ywQvXP/TlWXQnICcXyZxL51Y4Ci/px0t40bjvEqXu3wrtp9
 nPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681325970; x=1683917970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rfKtPIZLyI/9kyv0UlHMQW/E9H0QfT6xiEL4AwLN9MA=;
 b=NRa1oXX2FU2z7P7tP1gwPpK0QTnYC86U9ybYYIUKrzYGqdsuKCZKYJm4kT43grpWKx
 /X3ZgDb0x/IZdxuMp4GVeIrqe5ob7abcw407tzGjfHgrdE5nYXftevd7mCqyOjhxE7Yl
 4T4rNC2oIiEQDmhpuaFiqvHCJFdiVGaI0Dxc0zrrEf/OQ9jP2AWHAg/bbEva7aNEZhud
 DXeE/+/dtOuCP/5Hw8mO3Pd7Zdg69jk01uaODSvMP6TchzbNACMSGGEfKY42b/SrwxOJ
 QUrK7miXSrNw9GYPng+hb+7YyLwLpJeX896iAXOxiZbPjrsqK6G63x2QgG3yd/TL90b3
 OBMw==
X-Gm-Message-State: AAQBX9eK0wnxYtmvPV5fDN+tNISfhprgQANSQk5r1w4mUkAcD4ap3MI0
 on8kE/G5RTf6eCgFwndq59DNl0wIRNHdfsdx0fMehQ==
X-Google-Smtp-Source: AKy350axA4G9jLT9eVbrgGwoJ8edxXEnerhD+zot/u3c030bUJZC7VGQJkI6O/FFhxjTF6mlsmSnzBPsK6fIIXKEV88=
X-Received: by 2002:a50:cd42:0:b0:506:6ca5:3128 with SMTP id
 d2-20020a50cd42000000b005066ca53128mr82975edj.6.1681325970501; Wed, 12 Apr
 2023 11:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-5-dwmw2@infradead.org>
In-Reply-To: <20230412185102.441523-5-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:59:19 +0100
Message-ID: <CAFEAcA8KS1Hx+zwFPa=8em3RnQJFfDtg0S486U44Byb6+yujMA@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/xen: Fix double-free in xen_console
 store_con_info()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
> then for some reason immediately call free(path) too.
>
> We should just use g_autoptr() for it anyway, which simplifies the code
> a bit.
>
> Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

