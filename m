Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E454161BD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:08:35 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQKw-0000YI-8X
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQGv-0005pS-Lz; Thu, 23 Sep 2021 11:04:27 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQGt-0004qS-Ut; Thu, 23 Sep 2021 11:04:25 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mi2aH-1n78jb181x-00e1dz; Thu, 23 Sep 2021 17:04:18 +0200
Subject: Re: [PATCH 2/2] hmp: Drop a bogus sentence from set_password's
 documentation
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210909081219.308065-1-armbru@redhat.com>
 <20210909081219.308065-3-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0e397341-ada6-88d0-a7f8-e5e79be46cae@vivier.eu>
Date: Thu, 23 Sep 2021 17:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909081219.308065-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6xTomTTIVXTTAge02eFnj52a7F+YTY4Xul0E5dyD8kkckU/bc0I
 ZjuhYEPQ+qVAwrXMv29wbLMBSv1qXAG0YUXXLWHuZW8uVnve8hYXkr7IAuLYCqnryWG5VUg
 3fHxn1j0pTSISvqlXOlMy2BQYBHyrMTSmNicxbWvPDuvaIgEPStC9/sj1a5znziHvg3ffYu
 z9QpQlaLIHZoWk0ZyrJiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kmornE4Vn3U=:Mz/40mJUZ4b1OSLxPHMPwh
 oNbiAHiE275B8Z/AyuFnuyIR29+ZxS4Tkxaf3pPE5x6MdwaAwDI0EqQ2A4+fUpmhJ7tvfkVNn
 jrvCBPgwxPausoLiWfQvBbZUxylHYZLG5mkNtHbCdYb+5Ay7z10WG3/VDKFRDP41jXoKtGMY9
 GlMAiahJRqUqpeMNeOt39BSJFh/rpgqQ886yp9cASKceB7u9cPrt391FvcXd9iOoQ9V5Dv9tF
 Gfxu3AEcXVhPqRrTHNb4uIdzTjV+kGy1BJjYx2FA7F+tEc5WZ0RHkmjncgK74izjYGd9bv170
 wEnfnMhEllCUhrhj07Ehlno085lm3SbTAdNfTgKWQ1asReXbbIjTTODtRiQbduSS97krJK2kB
 2RS3lVJhICN5y1oqqZuAe/jUz5iP7ZCr4fvaGE/++AUYJ8yg0ti7G6+wft8ZkRzkbR8VWBkUq
 wEc+ADFcdhkSVIXZ4kURU1u+6qTO9zkO4ls/fEmF1eqYYjtWpB6DMIFoLqRLrov6qVkJU7ACf
 OU0aBuaZP2fbk74bUY6SWOx01bDbHgm4fWKNdSyyf/TdTmVxskR3CIK6s9iVTxNjuV9Odz4mi
 gfKV06cBOwAXt+ns8VtxsF89QSNHPKkkxxUmX51ka/BVziVLv+bBvZy6Iopj0zH8itXXyrI2q
 Cw1GAGKkf9UgpcjkZSljK3RVOP/8Fk6ki2Hf9F120aVfWnDvt4awLQmOiyduU8/XLMvShvURG
 +csjAvpxRUx9QnB7MINzp80X+RUMbS1qJgRQ4w==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 dgilbert@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/09/2021 à 10:12, Markus Armbruster a écrit :
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hmp-commands.hx | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8e45bce2cd..cf723c69ac 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1522,12 +1522,11 @@ ERST
>  
>  SRST
>  ``set_password [ vnc | spice ] password [ action-if-connected ]``
> -  Change spice/vnc password.  Use zero to make the password stay valid
> -  forever.  *action-if-connected* specifies what should happen in
> -  case a connection is established: *fail* makes the password change
> -  fail.  *disconnect* changes the password and disconnects the
> -  client.  *keep* changes the password and keeps the connection up.
> -  *keep* is the default.
> +  Change spice/vnc password.  *action-if-connected* specifies what
> +  should happen in case a connection is established: *fail* makes the
> +  password change fail.  *disconnect* changes the password and
> +  disconnects the client.  *keep* changes the password and keeps the
> +  connection up.  *keep* is the default.
>  ERST
>  
>      {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


