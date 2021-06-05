Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6139CAB4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:17:07 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbn8-0003KM-NL
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpblz-0002eV-CE; Sat, 05 Jun 2021 15:15:55 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:47311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpblx-00089V-Lv; Sat, 05 Jun 2021 15:15:55 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MNtjq-1m0XzJ1kqG-00OFDC; Sat, 05 Jun 2021 21:15:49 +0200
Subject: Re: [PATCH] docs: fix broken reference
To: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org
References: <20210511192950.2061326-1-jsnow@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1cd8a36e-d181-df9b-534c-8644eb2d59ab@vivier.eu>
Date: Sat, 5 Jun 2021 21:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511192950.2061326-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vUngjT9MLLZYN12Nv6aHIELADydkZSliAwHKjZ0z1LFW5J0ydUT
 Jk81q3aKGchFciT+lh1uLA12MjsT3F8ZVYQpywYWggk3oMuMj8EvjOLf2/EAYh1ct7m/Oux
 AEpg6jDyUBfV+Eg1ZHwC0WM+FZrEPPHknPGRQHf81BM1j8gLq8B6c4lf7siTi5xjcfA5AjK
 CP2S7hPFsy/mveayuMfgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2AkgLH6GB1U=:yrgjjgwnv80gJ+wvTba65j
 th6j3bztOTtMt2fXgdC/F7TDCLTLvkwnIoHaIXPc4t+dkusJNamL9H1obepoKL1tXoqytG7n4
 pFOEwi5xIq6XKm2+2gxy5b3Pq4bLA1pSFxXbQptO5U3KHRpvC+CkGojPMqO44kdJx/pEjtwho
 H/5c9LC6DFIq6P8G5aq93WIuky5jgeOwlIzqC8FE30o/VDu+Me2jNM1hod38FE/9LQlceNX1o
 IWSH3JoRcwho2thi8PyYXNH8iCB1BplDdy5KI4bdv1aVCkArZrFFakBTnWuizseyYxLLm3nMa
 0FVqXsqwHPe9Ra91PbSgVC3L7L3HBQP7EN57T/DEZPXLjs4LQuY+7ryQuZ8GM4q4ioZpHl0NU
 ItEd1deB+FHDkIfWROyzDx7BuGdmyPdf/ozoewxC97Rd/h86nEa8jyxwo5regRJZ9Uv1H8nRV
 KRr1d3MBMUPSbn/z23fgvT1DD7Ie32FWPzPxts6UxniSRo/xVHrY/FtjLoc5TpwhWxTwqr8oB
 vZtz7/LXfTCc1UfnenaEMM=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/05/2021 à 21:29, John Snow a écrit :
> Long story short, we need a space here for the reference to work
> correctly.
> 
> 
> Longer story:
> 
> Without the space, kerneldoc generates a line like this:
> 
> one of :c:type:`MemoryListener.region_add\(\) <MemoryListener>`,:c:type:`MemoryListener.region_del\(\)
> 
> Sphinx does not process the role information correctly, so we get this
> (my pseudo-notation) construct:
> 
> <text>,:c:type:</text>
> <reference target="MemoryListener">MemoryListener.region_del()</reference>
> 
> which does not reference the desired entity, and leaves some extra junk
> in the rendered output. See
> https://qemu-project.gitlab.io/qemu/devel/memory.html#c.MemoryListener
> member log_start for an example of the broken output as it looks today.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  include/exec/memory.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b27..3b9ca696061 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -571,7 +571,7 @@ struct MemoryListener {
>       * @log_start:
>       *
>       * Called during an address space update transaction, after
> -     * one of #MemoryListener.region_add(),#MemoryListener.region_del() or
> +     * one of #MemoryListener.region_add(), #MemoryListener.region_del() or
>       * #MemoryListener.region_nop(), if dirty memory logging clients have
>       * become active since the last transaction.
>       *
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


