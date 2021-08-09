Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AE3E4312
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:44:48 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1pv-0004fn-Jd
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mD1oE-0002cb-7G; Mon, 09 Aug 2021 05:43:02 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:45437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mD1oA-0006Lg-7K; Mon, 09 Aug 2021 05:43:01 -0400
Received: from [192.168.100.1] ([82.142.28.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWRi7-1mbvU22kO3-00XsZM; Mon, 09 Aug 2021 11:42:49 +0200
Subject: Re: [PATCH] xive: Remove extra '0x' prefix in trace events
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210809085227.288523-1-clg@kaod.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <415014db-99e4-f72c-f1d6-b0fb2709f49b@vivier.eu>
Date: Mon, 9 Aug 2021 11:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809085227.288523-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WhVcIViavcQG/LSuIw1DrnDiUoH2Sap7Gx7W7ecz8p+nI9ASkEP
 p3NNDK7WWokueoy90RRhkUCdyqt7HStZIemwGL86pDPhfL1bdr9WyukWE3firG63EDFwMDF
 Rl3g5R4JVltV2FcWrJEWtXPtCfeiC0vemhED6V/1Eh46KLQ48yhQDDOmX6LZJOQ45Z3dudO
 y7vkahOwZoBRWBXm44rRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6RGP2S1hFk=:EvWaG/qUIn/kM6LQYXneC6
 kZqgIhxy0bm8PqBAxNxZwXHpuu14HofXwe6fitn5LjjPZCOcRKpZgp0lgWEhLck0HOioIVoPr
 gu2X+WeCiJ90Jb1JYldN4UK8x3dEkm9PwAdJasWdMKL90JeHFPm4XZI4tZB0n+5ik4/A+kHTc
 f2ke1oKfJLIaktSqDDRj0HRnjxxAA6HyPKdsATWNzSa9y7JZyxbo4PWcBHPptLm13g5vY0caH
 aujYIQOSJ1i9yRDuAL0CvF/IDspIQiEf7TWToWugCtXt6PVFWd4oY9cm1BnBnZLljq6y8/TYa
 oc4Md2qwgMKdt4dBWONHJhj0xP1Zew/iMjmyRv/9KaHjIncq+EoRiTymSRqRHOD+oFO+qqWkU
 jWQo1RyCN85vGp1OUtoHWrI5iYjgujbR7C8ykf4FLmxNVe2Nt0intQFimQ5dWr5ghSMdE0Ttr
 2667gqFsy4t1W8feUkat8SuBpNTqCa5zc8BoLTMVxhKc1j5p7EKmYPuLqw7IUHpjJEifeF+l+
 quZVL3GByq7IQetY6d0UhIHz+pgc/o7ZoEwD+71bob8gQffj421G5I7cd02xrNO3tDdKLDX3n
 BznyFEZhc9MxaYVzpeHfL1Irbp34CUtxtCKbyYpeO/fPsyffqorL5vAex0gYNNB4G3laq1/Io
 0TlRQ4PdbrA0GzOx2fvSLD2Z9DCU1HPF5RU1iG9hTLGuAVCk9CqUEH2KgGC2cIcpKTFTpAnop
 sVDTqEIjMtRwggVnMcZTL311RRt8f9Q5q6efSsVQyYEnoxToiUA+amI25P9yeYz8gApriiFEl
 dkBgzRllo9G7kOq+gERzFVpRqRVNkq+nc/f9ZBFkQjZUu5Mlb/F8qfuFcSyn04BS/u1BXTD
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/08/2021 à 10:52, Cédric Le Goater a écrit :
> Cc: thuth@redhat.com
> Fixes: 4e960974d4ee ("xive: Add trace events")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/519
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/intc/trace-events | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index e56e7dd3b667..6a17d38998d9 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -219,14 +219,14 @@ kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
>  xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x ACK"
>  xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x raise !"
>  xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x new CPPR=0x%02x NSR=0x%02x"
> -xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
> -xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
> +xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
> +xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
>  xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_data) "END 0x%02x/0x%04x -> enqueue 0x%08x"
>  xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate END 0x%02x/0x%04x data 0x%08x"
> -xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
> -xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
> +xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
> +xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
>  xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
> -xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
> +xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x%"PRIx64
>  
>  # pnv_xive.c
>  pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=0x%"PRIx64
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

