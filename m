Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED82D3F71
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:03:35 +0100 (CET)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwJq-0003P3-0P
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwFe-0000dR-0g
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:59:15 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwFc-0002K6-CE
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:59:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id e25so999771wme.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=UaTci4XwVAJ8EgUMxlyzENCKRIcYbV+qRmp+fRmyIDcaJ0WXoiEbOmJz2coesKeexe
 TDo+l3vb54zGGzr+hBdDwjlhauOKqJmfKj6zy3QCYofM0s9F0n3O7lnqp1+nQbG46t8z
 LaT2bCBNCWbiydpfIxcWB0373ARBZsNjp33hEUqRVWvvMxhAQaJAJYj6yexswX/IyyDi
 3iv+H6oPbHDk91/f1Poc6BSlmgGlo4/S5a02ajHX7bTyzzC/npa/4ENHCwC9nmC6y3IC
 cVBelNKUTWNuOIkrZG9HJu3+uAWh519gCPQnjVpQl6tUMYiJP2545bSjPmsR2IR4P87I
 SHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=El/8HDltqc20NJtQM064mK33e9BHrswVDDyNpciOhezP3h1QHfjpxxNUMGJsgaWGht
 fppnDvgZnLhGeKSn1p9WLRq8+XIomixIE7CCdxyXtjLoB4bAAIT+Vi+FqGQf+C33nZZA
 P99f438QcgLEWen0hlmNaR1rM9MvqLHNqtCKKAbeX+UwABXR8lQxZQwVcWHMKyZvoS39
 hrt30lc8p04J/bjw6rJj3d7B1tUvM4VmLTNkksuTJlvAW5SzT0ok03MiU5ExXnMYmsNA
 jxRb8e3i9+egHTCp1rbI7h5BSiS0LiSj3RFBOCaH534gdpgPNTFuX3Wv9SgvokRGlQXR
 WKMQ==
X-Gm-Message-State: AOAM532E98Rr2p7T4+g9zc52k95nVIQXksVurk34ZdTu/dZSxqZgXWK5
 6jr1YkQxiHUtzzDbxaF2MIs4+A==
X-Google-Smtp-Source: ABdhPJzIBC4krVngOYHpC23y0v7zR9QeaBuTomANwaLziIeTDELzN2tLnEvcTzMtwK9HP6XoFrDy/w==
X-Received: by 2002:a05:600c:2652:: with SMTP id
 18mr1830279wmy.54.1607507950771; 
 Wed, 09 Dec 2020 01:59:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z8sm2443057wmg.17.2020.12.09.01.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:59:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD63E1FF7E;
 Wed,  9 Dec 2020 09:59:08 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-10-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 09/32] i386: move cpu dump out of helper.c into cpu-dump.c
Date: Wed, 09 Dec 2020 09:59:01 +0000
In-reply-to: <20201208194839.31305-10-cfontana@suse.de>
Message-ID: <878sa7fggj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

