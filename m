Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3FF4D907B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 00:40:56 +0100 (CET)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTuJ5-0003MG-1U
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 19:40:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alarson@ddci.com>) id 1nTuFy-0002fE-RI
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:37:42 -0400
Received: from phx2.ddci.com ([98.179.132.68]:58959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alarson@ddci.com>) id 1nTuFx-0002sZ-BX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:37:42 -0400
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <87a6ds40ke.fsf@mpe.ellerman.id.au>
References: <87a6ds40ke.fsf@mpe.ellerman.id.au>,
 <20220311135200.680127-1-alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] mailmap/gitdm: more fixes for bad tags and authors
From: alarson@ddci.com
To: "=?ISO-8859-1?Q?Alex_Benn=E9e?=" <alex.bennee@linaro.org>
Date: Mon, 14 Mar 2022 16:20:22 -0700
Message-ID: <OF08FB7AFF.45C7DDEB-ON07258805.00803474-07258805.00803575@ddci.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1 HF12 May 12, 2020
X-MIMETrack: Serialize by HTTP Server on PHX2/ddci(Release 11.0.1 HF12|May 12,
 2020) at 03/14/2022 04:20:22 PM,
 Serialize complete at 03/14/2022 04:20:22 PM,
 Itemize by HTTP Server on PHX2/ddci(Release 11.0.1 HF12|May 12,
 2020) at 03/14/2022 04:20:22 PM,
 Serialize by Router on PHX2/ddci(Release 11.0.1 HF12|May 12,
 2020) at 03/14/2022 04:37:41 PM,
 Serialize complete at 03/14/2022 04:37:41 PM
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1
Received-SPF: none client-ip=98.179.132.68; envelope-from=alarson@ddci.com;
 helo=PHX2.ddci.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Michael Ellerman <michael@ellerman.id.au>,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>Alex Benn=E9e <alex.bennee@linaro.org> writes:

> I was running some historical tags for the last 10 years and got the
> following warnings:
>=20
>   git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/g=
itdm=20
> -n -l 5
>   alarson@ddci.com is an author name, probably not what you want
> ...
> The following fixes try and alleviate that although I still get a
> warning for Aaron which I think is from 9743cd5736.

Alex, I'm not sure what I can do to help, but my email address hasn't
changed, still works, and I lack any sort of accent (just ask me :-).


