Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49A40D793
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:39:39 +0200 (CEST)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQonq-0002VM-Fh
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQok7-0003D9-Hv; Thu, 16 Sep 2021 06:35:47 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQok5-000277-PC; Thu, 16 Sep 2021 06:35:47 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7zJj-1mv0001R6R-014z98; Thu, 16 Sep 2021 11:52:43 +0200
Subject: Re: [PATCH, trivial, for-6.1] target/i386: spelling: occured=>occurred
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210818141352.417716-1-mjt@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <68147eaf-126f-c2b6-3269-c1b7a5aa8a4d@vivier.eu>
Date: Thu, 16 Sep 2021 11:52:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818141352.417716-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8tlLkUz8UjUU/fgVdPUmNK8PLQmnjufmMi5+JYE0hqySgSZk55+
 7qQCwYjUv5slL/sVia9lX7yck597xWk4BdxS9W8o30ltGe2w2vCuMMOteN+MSoj+EOS89QR
 BRr0Vw2BoGImc774l7/rno4jmfH1LJ1BwYn/U6Cjwhah+3CQOuCh9oHg4YQjY/X9gT2sdDf
 /hsWfmwuj80JchI7ulC/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KJ7xXlMjvHU=:4BZ+Giim3KHRiQhwaiHX+4
 /Twgel+mT2mRcbfVjKnZOwrTi/fCrFYBbR2EgsUCnIfEPSCpQvi0kHn2F3tGh+ILvZMfoIeL+
 vQCVH30HmT5mUbbTFzq1O8anbnYhyasq1ZBiqwf3BHhvDvj8GoRKJEEkvcONamVW7NA0BAitz
 DwBMYOxG+UCdxJYhsq2qpv/4OeJAICguqfHCsGIAJMZ2vra+3kKUCH+dbDpNVsdjrHGBe+oxD
 GyB2hXZfAFpO5hobDs+D3Ouxo2RfLycb/G544zDlYPDsqjyZ/OEn4gsuKLgwN+77y13oXhOs2
 ge6gAjRKQSdIWMI6h5wrxFAv40aUqwMbI0l45CVG/GbdneqyM+U0V7ouNh54ZnIxHDiBckepE
 dziV7+b6tfPyajMD13g4wxB+YkHJFaj6EWNJoc3V/cBs3+VAT+pLIOi7yIf1YkiNBDySVfiTS
 Vag9ww3rwoKDiC5m/kJwxqVk+2qg5EJb8B2Nn8mHHzofTXyWU/SF4+ViSsgHP+Je8jzEGvPF0
 zfHRvmUuiJvHJdljd758sqbYNkJy0SMBzO+zZydg/kcCK4Xf6HYgiyaRD1t2Z8gfArImIlov7
 sudp+ttkKhgtR4T5SEI9pp3DxGUMpP1lWYKHQ+HDDcNXNAeFkScTE0AAaNgs4H1BZ1xpph7P0
 0lOEqiN7X2dig9dFREOmBumNOxNAr/qpbUefE/MpvMjwJ6L6yIskElAae65Aq4/lMk9IVzmPE
 VyX4ypXToSTvWiADKLaX3lsALaXVUigiP0F4e+pcMhIgcX/lk2v4WIpGi25rpTo3BRVzGPK+V
 kbUOC4R
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/08/2021 à 16:13, Michael Tokarev a écrit :
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  accel/kvm/kvm-all.c      | 2 +-
>  target/i386/cpu-sysemu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0125c17edb..cace5ffe64 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2469,7 +2469,7 @@ static int kvm_init(MachineState *ms)
>              ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
>              if (ret) {
>                  error_report("Enabling of KVM dirty ring failed: %s. "
> -                             "Suggested mininum value is 1024.", strerror(-ret));
> +                             "Suggested minimum value is 1024.", strerror(-ret));
>                  goto err;
>              }
>  
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 1078e3d157..37b7c562f5 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -335,7 +335,7 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
>      GuestPanicInformation *panic_info;
>  
>      if (!cs->crash_occurred) {
> -        error_setg(errp, "No crash occured");
> +        error_setg(errp, "No crash occurred");
>          return;
>      }
>  
> 

Applied to my trivial-patches branch.

Updated subject with mininum=>minimum

Thanks,
Laurent

