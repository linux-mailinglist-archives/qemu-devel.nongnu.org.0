Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA936FF6A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:23:04 +0200 (CEST)
Received: from localhost ([::1]:38310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWr1-00016f-Vo
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWJh-0003cx-Fx; Fri, 30 Apr 2021 12:48:37 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWJf-0000pU-AM; Fri, 30 Apr 2021 12:48:37 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsIfc-1lJUI90HZC-00tmdX; Fri, 30 Apr 2021 18:48:31 +0200
Subject: Re: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
To: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>, qemu-devel@nongnu.org
References: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1cc238f3-c695-4975-3e26-de98da916ff0@vivier.eu>
Date: Fri, 30 Apr 2021 18:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CmHZIYCLNhRw3X49Zqv5paIiFcAtphDGJUK9pHroz+9CydrGqvO
 Dgp4o+NWSckO4Mjnei7wdO4NYN8r+zz6NM4NHOoFei4+a5skXz14bCiDBuNZIdrQvKKG/99
 tcQJGziQ33AspTnPQaY8RbxZK72SgSuxW+x30ZEpWWylzpAqGyws/goVBPrFuqso5SjnQi3
 sj2Jm5JoQ0wEdyl1n/OfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lgPrVUiV+YU=:SAUOoJsYsP/AwhcD8ZZ/lz
 DEhLfLoqOdYDdlBgUaR5B+ivmcLIsH5kZqEzEzutNSYRolvbpWwnNDeg5Mg+wTkmwd0lidJqj
 UiQVv6S6nK2/CozZbc5Ld0tjXpilZn3zlAfZib6HqcJqPr1m2mYSju1OHchWXU/OoJROs3U4L
 E8FStCDRYnF3eUdwP+/m1HTKeIynfS87nRdnMWLEA8ufTSU0me3RYZVjd2Q8QLM0W/VBpV2Ig
 DGENf41qihk6R2eNdxRjUFawCyZz5b9jWETCUvSH2u4Vr7EuCAcOB7Gd1MuKPytcfbcuh4T3U
 /DW6ZjRLR7Mba0J+rd+QL2H1jquIrlXHhPOmucRPHsWYQ8W88uoQ5tdTBQgqlQqyJjK6IhfeA
 YsIcoDgKSo66hkwMgph7rbhhsnXib//C7eI3EhhrIAWSAtuErGUwYfQF1nd76akbhcnTWHVJX
 kkUmjUVrq4c7LmSAhhjqJSANeAipiGmZ2718lg0t+z2//aGlOBYSkQ8QpqIZUaMtM57jjfayl
 SjYmiYIWzxMOINtACpLhpc=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: +Samuel

Le 23/02/2021 à 03:41, Niklas Hambüchen a écrit :
> As the added commend and `man smb.conf` explain, starting
> with that samba version, `force user` must be configured
> in `[global]` in order to access the configured `smb_dir`.
> 
> This broke `-net user,smb=/path/to/folder`:
> 
> The `chdir` into e.g. `/run/user/0/qemu-smb.DCZ8Y0` failed.
> In verbose logs, this manifested as:
> 
>     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.c:159(chdir_current_service)
>       chdir (/run/user/0) failed, reason: Permission denied
> 
>     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.c:167(chdir_current_service)
>       chdir (/run/user/0) failed, reason: Permission denied
> 
>     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/uid.c:448(change_to_user_internal)
>       change_to_user_internal: chdir_current_service() failed!
> 
> This commit fixes it by setting the `[global]` force user to
> the user that owns the directories `smbd` needs to access.
> 
> Signed-off-by: Niklas Hambüchen <mail@nh2.me>
> ---
>  net/slirp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..82387bdb19 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -850,6 +850,11 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>      }
>      fprintf(f,
>              "[global]\n"
> +            "# In Samba 2.0.5 and above the 'force user' parameter\n"
> +            "# also causes the primary group of the forced user to be used\n"
> +            "# as the primary group for all file activity.\n"
> +            "# This includes the various directories set below.\n"
> +            "force user=%s\n"
>              "private dir=%s\n"
>              "interfaces=127.0.0.1\n"
>              "bind interfaces only=yes\n"
> @@ -871,6 +876,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>              "read only=no\n"
>              "guest ok=yes\n"
>              "force user=%s\n",
> +            passwd->pw_name,
>              s->smb_dir,
>              s->smb_dir,
>              s->smb_dir,
> 


