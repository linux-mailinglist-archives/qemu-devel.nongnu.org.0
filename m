Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E7262F4B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 15:46:15 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG0QQ-0000it-FI
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 09:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kG0OC-0007IB-IY
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 09:43:56 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kG0OA-00078Z-SF
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 09:43:56 -0400
Received: from [192.168.100.1] ([82.252.148.206]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4hex-1ki9lA02Fz-011gFc; Wed, 09 Sep 2020 15:43:51 +0200
Subject: Re: [PATCH 1/2] Makefile: Drop extra phony cscope
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <159916226258.691541.13056254320330610953.stgit@bahia.lan>
 <159916246865.691541.16619858522304817323.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d41f146f-a141-a1ff-1cda-cf1b0eafa28c@vivier.eu>
Date: Wed, 9 Sep 2020 15:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159916246865.691541.16619858522304817323.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lLcTnrwT0sxSM3Ox5zERt+gI3ECFkTuw0ljPuNgStMXDu9eldt6
 NX/eNQLEM8muWsdOhYH7Vyu6ijUdl+t+ZvjfuwkIyYGWPJJg66+U2CJ1p0LdlXbs/RM5svo
 Z7A2jAZ/KIdsj6kYdxJ0ntx9VU/V4ShomJlEAyxNGk2UwNmBPsYekBTvT0bezJi0ss2jzcN
 C+EaRC2pb4SICgjIMc7aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1AfVAllc6C0=:6A9nW4bgHgzUkC8sxucD28
 A93ilHorjAAUMlNDZkIqLccM8rJWstaZzs+Eoe50Q15VLTTyvygzkq/A5A34r/vKsvx+Y7GMv
 Ra0OphkFvLOJ/rSUFwO6IoDpJ8UH5+zFceEfuuDhSL4Zaeg8y7FbcR07XGCQUr25BzxAQdMaY
 FlpYPlU5oPitC7oVLtn4kJWqXS6tnjjBAllu5xq35N7qFacEN03B/za9C+iJgUY5VTjHus53i
 wPvcmhqpYeauqoaKVZLnBZltcMHHn6FkXKBBczUK29TS3wopGeUzexZfWsliEa85AuQrt5N+h
 4D5iuRPC3dKOo2RSrCTGmnoSDBt+oG5Q9Wkml5TrmMkLjTXKmiReLSd0ctZqSM0aOgA7huMER
 p4WVrPol4VFbmGGb+1qjuASba/dTBa6fb0l2OjYXrYyRl+qpjWXJEF+ba2Gsp0GemYwLZuCVF
 lXYF9nmmQ8fvYfRA3BRRfN8RcjeblAuLCBQ5OJEkI3LwMeV2AYD/fkSw5EWXQ5FhIilGzWQbQ
 IqRI9R0ZczhZx8dS1gdac/SyzvJvpysWGEwDea2hH5hatgg1HLmXIsRtMipUAZYbDgq/annG2
 SYT5G6YRYQMKQB2OZpA6V3UhnuddtcrlZKkzVen7+Umppm6DWpykR7+FKwkgQHaVninja6xeP
 lTDF5BEWiJtSF78VGyODbbjtgTdRFxVKPdXUBUhOaEYIEiJFjJKt1QwK5fW4UXFGiJjHeWVeG
 WarKgzGWvCnGRnkPGciTXQrZHqvMZBhdLB2BUHvs+Sa65eTPRkP0cWp8eJ6sLN3wabJIb87n+
 9d74kt3Zu0to4aMDnfa3ZIg04wC0ITDS4qeDgL5aq7IE+tzq3k+Z6GtQLz91eKbR12wCsUs
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 09:26:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.576,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2020 à 21:47, Greg Kurz a écrit :
> Commit d79864058a64 added a dedicated phony line for cscope.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ed354c43b0ba..a9d3e2c4d375 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -127,7 +127,7 @@ generated-files-y += .git-submodule-status
>  Makefile: ;
>  configure: ;
>  
> -.PHONY: all clean cscope distclean install \
> +.PHONY: all clean distclean install \
>  	recurse-all dist msi FORCE
>  
>  $(call set-vpath, $(SRC_PATH))
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


