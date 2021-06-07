Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861239E188
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:11:28 +0200 (CEST)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHqZ-00069E-84
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqHo1-0004RK-T9; Mon, 07 Jun 2021 12:08:50 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqHnu-0003P6-61; Mon, 07 Jun 2021 12:08:47 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McpS0-1lGg4I3xuU-00Zuoa; Mon, 07 Jun 2021 18:08:33 +0200
Subject: Re: [PATCH v3 24/26] linux-user: elf: s390x: Prepare for Vector
 enhancements facility
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210607110338.31058-1-david@redhat.com>
 <20210607110338.31058-25-david@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b8197afe-cf1e-8e16-1505-bede73e53c63@vivier.eu>
Date: Mon, 7 Jun 2021 18:08:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607110338.31058-25-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jvh8tlCaJYGqRvEPFHLbSTi/1NJt7lLq0lQ+wd37TR41nVltOWD
 EGlynZz1oYjyCMYc/yCDXIAtSN4ISuVaaEldmaXxa0g6SojdhLjTpE1NGKApJ18ArySdQfX
 tJXUlZdclu+JYDZ0fbJDp9mWiYhkeJ8iNkERYXugq8V3L4SY1lw7tzWhC6TpXJL9U6VVOOO
 eKkO49gFyaL0zdQogSv5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ffS8ySmkQLg=:oWSB3l4j8kO49dBXsDOTvB
 T2ZCYqVW+g/syjUxSlzSIR8UHTu6jGdz8s/4eX0AEzzsSwAk1fF2PhZu5fhIl8O8HwQ81UrpV
 5VCTiNKRvL4qLYs3xN5c1SxV+JnmME2vU8W79llfNs8+Qy331YRC9v5zaBajqQkcAT/E50Dvp
 63r/wET/3O7Wl54NJnYPw7zcKrrxzRyL988WB4Qh+naB32K+0rm9ZoeEbtr1ViaCKwFhhUJV7
 xaqzcepOyY5/uPqkFomjEPn5HGh91sNTdgELs5mMv2dMFOXmKbIEpNJhxwRdlIC+cfTNBVW0o
 Ug69pzAzKq2DEwfBmAdij62mCJtqk5WsD02LcBUFzrl28vYHw6OVyjDNWKsjQ/8Q69dxKwSxu
 MYReRfcfZ2E4S4ExJSB32rBgp0KCvdmmwnSoms5itskNSuKqlsa16sga1lOd3NNns4nE9tiN6
 fmbYiPGXc05xPUBqXIpoUylKLxfIuT2OIqjBz+vYRgL+d+nL+YT0ZK9ZyHjfP4pQ85y55QkSz
 BLR8crppPoTtnOIjG+Ipgo=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/06/2021 à 13:03, David Hildenbrand a écrit :
> Let's check for S390_FEAT_VECTOR_ENH and set HWCAP_S390_VXRS_EXT
> accordingly.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/elf.h        | 1 +
>  linux-user/elfload.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/include/elf.h b/include/elf.h
> index 033bcc9576..0049d5a318 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -605,6 +605,7 @@ typedef struct {
>  #define HWCAP_S390_HIGH_GPRS    512
>  #define HWCAP_S390_TE           1024
>  #define HWCAP_S390_VXRS         2048
> +#define HWCAP_S390_VXRS_EXT     8192
>  
>  /* M68K specific definitions. */
>  /* We use the top 24 bits to encode information about the
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 17ab06f612..4b0172339e 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1376,6 +1376,7 @@ static uint32_t get_elf_hwcap(void)
>          hwcap |= HWCAP_S390_ETF3EH;
>      }
>      GET_FEATURE(S390_FEAT_VECTOR, HWCAP_S390_VXRS);
> +    GET_FEATURE(S390_FEAT_VECTOR_ENH, HWCAP_S390_VXRS_EXT);
>  
>      return hwcap;
>  }
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>

