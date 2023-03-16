Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183946BD337
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpLW-0007Hf-40; Thu, 16 Mar 2023 11:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcpLR-0007H9-Ms; Thu, 16 Mar 2023 11:16:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcpLP-0004N1-P0; Thu, 16 Mar 2023 11:16:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkYsS-1qNgh33Xsk-00m3Ux; Thu, 16 Mar 2023 16:16:36 +0100
Message-ID: <67509d48-cf9d-bd01-e284-72f39c4d74f0@vivier.eu>
Date: Thu, 16 Mar 2023 16:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20230314114431.1096972-1-peter.maydell@linaro.org>
 <8f048b8a-55f0-d124-3cb7-9a34e863149f@vivier.eu>
 <CAFEAcA_wAUgEiL1T_E9mKKW7PCpdRASKaBnTEydJuC9cPGme2w@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA_wAUgEiL1T_E9mKKW7PCpdRASKaBnTEydJuC9cPGme2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e19i91xtrhbj9cYpYCZ2IvjGjbkAIyBG5gQD+UXo4EEVQ8rmZp0
 VAaO7SVVG/LraMlP/2jZKGnPl13JlNfdUGY7q+cJlkmalBxdG+5EBEoEAr+zu3IzAQlQSAx
 MwV0uvmHWaTVbA+fQfN6CwIVJatDJT90gce/sAaCGJHzyqViBZKIMQtl00Ze3IWITnIUIS2
 2kYsqmCbgiT1r78F3QagA==
UI-OutboundReport: notjunk:1;M01:P0:85O/hW/1BGU=;m4hJcr89BmVHdtAw09qbRPlgHxf
 lDgCYujLQu8FwBkarQAxYceRm+/NNlC8Nd4LqtGsRqKomHUBEDk16MffUqtUOi1D2PYmYy5Dq
 43lTZcXnxHhejFSIN2bWKCb2/U2Yi59kTuyfbwWugFEgtNU5+L5oZyEgsuk9JhhqAN27PxUrE
 9b6M08F9fVXp7axfJ7gLtapg5uBNdydd8HYzJQeag6Fs6rZvie3Mxw4BUlZx1eIJvN8GdU50J
 YDxj4aSv5sh2etVWlULI4bSkGnnKpu81tsdn1FVHavlmdJ2/zg9xyjaSnBoDCYi9+DgnsH3fX
 I/+3MIBiCOJEMfGghjzB4238vGVxrwXo5fHIegBUvLj1kgRbuxMDKttI0MB16mQ0X4QdeA3bL
 LueMLkw0/IpOpDfI2sfwqr3uBCvDL/8hRPs8OeDo0pGr8hGxkeoEptvFa96nDDl8X+jvf5poO
 znkqa7v/kPjxWhZ0vLdp1igD3LNhg1NHClpGC7DHkN8L6COBEXYPYXl2aIEUBWKtPCzqrFdS8
 ZCtGZ3HmmFa5LnkChwws9zJ6xjzEjQunNeaN0dpFgQ3L6YOd/cjh16/+VV/YPEcnVmHXYGTOs
 RtlG5pMvpfiwNkMg95COgSw0/ntUPV8if0lwG4ENueeUdkvlPdQp/+FbC3NA+BRkgGhP5qBsd
 sXqQvTAJ/Z8WSHG2LWvesOo2feCESltf7LQ+RQ63HA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 16/03/2023 à 14:42, Peter Maydell a écrit :
> 
> 
> On Thu, 16 Mar 2023 at 13:40, Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote:
>  >
>  > Le 14/03/2023 à 12:44, Peter Maydell a écrit :
>  > > Currently, the kerneldoc Sphinx plugin doesn't honour the
>  > > --enable-werror configure option, so its warnings are never fatal.
>  > > This is because although we do pass sphinx-build the -W switch, the
>  > > warnings from kerneldoc are produced by the scripts/kernel-doc script
>  > > directly and don't go through Sphinx's "emit a warning" function.
>  > >
>  > > When --enable-werror is in effect, pass sphinx-build an extra
>  > > argument -Dkerneldoc_werror=1.  The kerneldoc plugin can then use
>  > > this to determine whether it should be passing the kernel-doc script
>  > > -Werror.
>  > >
>  > > We do this because there is no documented mechanism for
>  > > a Sphinx plugin to determine whether sphinx-build was
>  > > passed -W or not; if one is provided then we can switch to
>  > > that at a later date:
>  > > https://github.com/sphinx-doc/sphinx/issues/11239 
> <https://github.com/sphinx-doc/sphinx/issues/11239>
>  > >
>  > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org <mailto:peter.maydell@linaro.org>>
>  > > ---
>  > > NB: we need to land the fix for the current outstanding
>  > > warning before this one can go in...
>  > > https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/ 
> <https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/>
>  > > ---
>  > >   docs/meson.build         | 2 +-
>  > >   docs/sphinx/kerneldoc.py | 5 +++++
>  > >   2 files changed, 6 insertions(+), 1 deletion(-)
> 
>  > I've applied it to my trivial-patches branch,
>  > but if you want to apply it via some doc or misc branches, let me know.
> 
> Trivial is fine, but make sure you've put in the fix for
> the outstanding warning first :-)

I didn't take this one but:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg949558.html

Is it ok?

Thanks,
Laurent


