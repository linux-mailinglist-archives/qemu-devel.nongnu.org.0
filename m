Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5625433069
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:05:05 +0200 (CEST)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck7M-0006V1-PR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjsH-0001sR-0o; Tue, 19 Oct 2021 03:49:29 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjsF-0002sM-5K; Tue, 19 Oct 2021 03:49:28 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M91Tq-1mfThS32D0-0067Yd; Tue, 19 Oct 2021 09:49:24 +0200
Subject: Re: [PATCH] README: Fix some documentation URLs
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2e0305e0-00e9-5f6a-fdfe-4a5b91a9c2bb@vivier.eu>
Date: Tue, 19 Oct 2021 09:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bzqB/0LfG+yhTnuMi2SR0attfBLxRy+76PJ244ZbuDtM1AjXIq9
 f+kz2McCw0eF3N75wO+Yd7x+79IsYt8wI9LnB3TQSzEJ1dvh3R3eDvMrBwnkqtYVb6Koisd
 cfDlubJ/K/I/PyXeNA4C75XoUtn677f8iYb2AWPjJsAQxI6Hn5NGNSs437/uB2y8TcwhY0B
 +2Et3UIVTIZ5OFfrdRFig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iTPkwN41Oys=:XK8rBGyPG2Lor4AgBVWmYi
 2glbxBl4Ss9Dl4/iwmlFMeuAmi7ywKak1JkUXRHrmtzgPyu3Vk6J+CH/sPA+ssqz+RavsdoSC
 aCsyWoeC5tpb/NxYkGPQb7Bfq23Otm3T0czJhmHOm3r3Nwb7SacfHUzBvLIQKwKCB7R5O3mRr
 qlSroYqmAfmmOk12hZW44AmJqCwBFzlyRQ3qO/iDCgmWBy7ttzGbYmxr8u0rW1NXLa2Tf/8qu
 aCZoTHa3IFNVr6uGWXUTsXkVhMY1yOdUoKDYJDxCNWbwQ258iQs4gxIqUs9B62MRa+Hun0swZ
 w8U7cTvW0a66ciAN4pKDakfsrt+kGPuUWvyNbGSgB+cgpDDVt2jgJjaMSykZhdzrsmJDQL0PX
 QztJoqGFo0ssm8MTFOhY7plqnGaVMMkSpyuC8VckqKDp//SeJUnf5PqSZ7zfOg/HLCWwYmLmC
 ucl9bhOVBRJxQeblZC0gyF2diYNfhapCQZU+dHJXsEf0zVJm8qPRfNFNIS6oAPYroaHv+Dpy+
 WC5IEeMoepIBYBKbMje+Hsh7fOjTW3FreKIm0ExWDtLDI6dzVlNWpJRwb4e9X54YO8SeQixrv
 IxpemAg5TUwslcoWM2EU7w674lSymrHrmg5iFusIVOu/X7WZY7SakCzRSUnCly732KOaihLRq
 bP2jB1xSbQCoaICmfie6RxxwUfQPmadxF2bm6FU6YRLfy5LI6/M2EWnaIBfzLZ5zUwwWVjcMu
 nkw5rH9wwffKHKSY7v4ZFU8uqmtUOCduj6AiTw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/10/2021 à 15:45, Greg Kurz a écrit :
> All of these pages live in the wiki, not in the main web site.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  README.rst |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/README.rst b/README.rst
> index 79b19f1481e1..23795b837740 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -59,9 +59,9 @@ of other UNIX targets. The simple steps to build QEMU are:
>  
>  Additional information can also be found online via the QEMU website:
>  
> -* `<https://qemu.org/Hosts/Linux>`_
> -* `<https://qemu.org/Hosts/Mac>`_
> -* `<https://qemu.org/Hosts/W32>`_
> +* `<https://wiki.qemu.org/Hosts/Linux>`_
> +* `<https://wiki.qemu.org/Hosts/Mac>`_
> +* `<https://wiki.qemu.org/Hosts/W32>`_
>  
>  
>  Submitting patches
> @@ -84,8 +84,8 @@ the Developers Guide.
>  Additional information on submitting patches can be found online via
>  the QEMU website
>  
> -* `<https://qemu.org/Contribute/SubmitAPatch>`_
> -* `<https://qemu.org/Contribute/TrivialPatches>`_
> +* `<https://wiki.qemu.org/Contribute/SubmitAPatch>`_
> +* `<https://wiki.qemu.org/Contribute/TrivialPatches>`_
>  
>  The QEMU website is also maintained under source control.
>  
> @@ -144,7 +144,7 @@ reported via GitLab.
>  
>  For additional information on bug reporting consult:
>  
> -* `<https://qemu.org/Contribute/ReportABug>`_
> +* `<https://wiki.qemu.org/Contribute/ReportABug>`_
>  
>  
>  ChangeLog
> @@ -168,4 +168,4 @@ main methods being email and IRC
>  Information on additional methods of contacting the community can be
>  found online via the QEMU website:
>  
> -* `<https://qemu.org/Contribute/StartHere>`_
> +* `<https://wiki.qemu.org/Contribute/StartHere>`_
> 
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>

