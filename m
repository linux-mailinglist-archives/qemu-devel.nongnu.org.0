Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7F64F93D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Y10-0007oB-OM; Sat, 17 Dec 2022 09:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6Y0d-0007no-9B
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 09:17:51 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6Y0W-0001bb-Nm
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 09:17:51 -0500
Received: by mail-pg1-x52a.google.com with SMTP id w37so3524570pga.5
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
 b=HTaeci6QMzAYrKlkHCibDPNesH6NQaFsq3gt8qsDvuoU81500fdPGn4uv1HcSnY3X5
 CARiaImyTb5o8SkSU+BQl+NzF0t+Yf5o5BHTKAm+WvI7SSD7dotyo4YyIuXvxquAOj4J
 Y20FmGSTG6duP2gemACPkmKXhHtGeVQtXwZ5cmnSnGLRh0UXR6oh/IB1faWQWGLWoSFP
 e9DGkYZOgDvWwgAY0UMXi0XTY9AcpmZZ7xyVezzEFSQNXjx0vFTJbz1C81kB/QNzTYNa
 4xCisy5PiI6ZCMqLfnA8IsVA+12hZj3RqdK6yVrDXzHa7KSd0qTH17/bHLIrOnHcLQ62
 nwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
 b=0vR8Lv+SmVb2SCM9w2qPcJL8pXzBVfzj/AeJevggADynZziwjZBfZROzB5S6n0F/+/
 WaKYNujIPP9A2+lttwgEFzc+6XdrZ/STZC6tw06Mf1s6cO8jEkTuwIJM4Ut0Um0PXlGS
 gXfG1V1xiWhmvmJqS3XN2AXPuzzO8JgcZ8+gJ67bAd/ssLJmR2NDwZA13mJquxEG1AVk
 ViE0sLQrCKRBAD/XJRb40hzq+SMR53cg6spCruVaZ0FVH+3PiU5VCNofqQfhEZHaoE2A
 us7PUB3VmQhi8PZKqOjQd6Kiom5/mYL7uz2cGpAdBQ78NHLJqO2o0SI7TOvp41VidCrR
 iOfA==
X-Gm-Message-State: ANoB5pnANvychdIDXj4G+rQ+HHyPFJJsg0N19cPI4Asfl0YVayw9OJYl
 OdIQTch1NveNLMYRi7qqY2GlyeNZY9xLaO+11XUauQ==
X-Google-Smtp-Source: AA0mqf4sJTQzxVAyuyfPndN+cFfXCetE5MzcyHYxSEjRglGqnXHR5+VpVD1/DTblX0u9sfsC1TWJzqUEUB+Gxw/fd3Q=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr80489363pfe.51.1671286663082; Sat, 17
 Dec 2022 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20221216220951.7597-1-philmd@linaro.org>
In-Reply-To: <20221216220951.7597-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 14:17:31 +0000
Message-ID: <CAFEAcA_Foy+k80r=vjXx2JO1T=2qFT-_7uvPhAuoSz-=XDanBQ@mail.gmail.com>
Subject: Re: [PATCH] exec: Rename NEED_CPU_H -> CONFIG_TARGET
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, 
 Richard Henderson <richard.henderson@linaro.org>, haxm-team@intel.com, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org, 
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org, 
 Cameron Esfahani <dirty@apple.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paul Durrant <paul@xen.org>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Yanan Wang <wangyanan55@huawei.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Peter Xu <peterx@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 16 Dec 2022 at 22:09, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> 'NEED_CPU_H' guard target-specific code; it is defined by meson
> altogether with the 'CONFIG_TARGET' definition. Since the latter
> name is more meaningful, directly use it.
>
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This feels to me like it's overloading the meaning of CONFIG_TARGET,
which at the moment is "the string which names the header file
with target-specific config definitions". I think I'd rather
we just renamed NEED_CPU_H to something a bit clearer, like
perhaps COMPILING_PER_TARGET (better suggestions welcome).

thanks
-- PMM

