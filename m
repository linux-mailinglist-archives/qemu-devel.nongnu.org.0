Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724A4CBDA4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:23:52 +0100 (CET)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkUp-0000dx-0l
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPkTe-0007yf-Cg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:22:38 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPkTc-0006QE-Mi
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=7lbNvLuCVAqxnyoDahxq4JRA9TTxsYLxKyatoYfhd+0=; b=Ys11jCuKfa8183+2jUQdakkWXX
 jdHRIuYEn2loD9YrFhyfHaCtqIqUjV2VoTWUo9hAQTM3DFt5/Mp9qBFbRgtPZKQmYc3BDCQVmqdFW
 cDg7aenS4h2v23xfe5nJAX76LhRzQF7Nk84XD0TYDAnpUP9S/dKZonVwufUYpzFEPnQI3CpvdbGvl
 UkeIPFB1AR3JTyDDFRjA3I/pvFiXJl2/UED1jzy+uBY/gJNYBCEEeeRUPXPgY5vIf14igj8pc9ssr
 5Px45wGvG4v7eSdMfQ3AUN8oWkNpE8BXRt7ZXmQU61APy0sJyEo9Yg6SK83s9UDYwoGRg0dCJMyih
 i8ZvOBz8CsoeAdE/45jk+CqsIKnjPQpP7VY4qNwkMt/3I//hyT9/fiE4UA92OkZ3Qd0bvll5vK07k
 e9t+8IK4BGu0dKvIkutrqR44tF0fIE+BPkSGzs7Z8C/7Qh/PEkQxICXb/WfYPEYcbK/z3gtLn5h8K
 nY10p9iIH9yHbgQqwdi1YetfFw3TAp14dn5TSDcyOdMlBp28uvdBk4yc2nfZTY2E5pjqaOiHW9z7t
 F2BjI8jZMNdBQ6sl8Ck9kmvoJ9HlaQkX6RETqxjqL2bZxeyBtc+qUPB9Rka5b+OS4OZ/6UX4hIdoX
 j0KBHx8gmtCXT31xqBfEFE/vofFgR6Z4SwFIBJ8TU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] 9pfs: drop Doxygen format from qemu_dirent_dup() API
 comment
Date: Thu, 03 Mar 2022 13:22:34 +0100
Message-ID: <2128762.L7kK4k7ppQ@silver>
In-Reply-To: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
References: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 2. M=E4rz 2022 19:30:39 CET Christian Schoenebeck wrote:
> API doc comments in QEMU are supposed to be in kerneldoc format, so drop
> occurrences of "@c" which is Doxygen format for fixed-width text.
>=20
> Link:
> https://lore.kernel.org/qemu-devel/CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va=
0D
> 7yepJSa3Jyg@mail.gmail.com/ Based-on:
> <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



