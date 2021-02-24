Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0A323479
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 01:31:58 +0100 (CET)
Received: from localhost ([::1]:56520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEi5s-00044e-La
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 19:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@ozlabs.org>)
 id 1lEi3l-0003F2-4A; Tue, 23 Feb 2021 19:29:45 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:57655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@ozlabs.org>)
 id 1lEi3h-0003HM-5m; Tue, 23 Feb 2021 19:29:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlcHR0KMnz9sTD;
 Wed, 24 Feb 2021 11:29:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1614126564; bh=5NmrheZip14jcw1oeK9ILrd7aix0Z4/aqWfyuPFZ0hE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=YmeMiKhKyCoTrfjy/srHC3MYLvknVu8fcIf9xsN+1pBgdglc3myFGH0HNwAaz4rOk
 WdBOhnLdl2FQi6DBoZ+EysxFTHCALQf3rlp37K2+KendffEnRZoID7w7XR4ZiDkMpP
 8e7nCRFTWhFOQwNX5m2bMB2ethVb4TaF7D8GnYXn6CFTcpsNQNKN7/Yf/OjNN2vvPT
 7VJzzjol9/tOmPP+KElGxuMmRnBJmuXeoKEssb00DlK+H5BWCDYtBDXBntYaFXtCKE
 gADlMw1emOFT0bHjGkIMH+sq032LE+sJVm1SZDwzEMV+1EIVhTC8YmJZ4SB3NCD401
 gw1HzWrG5lXCg==
Message-ID: <4023a93314e1ae69c19a4a93e87b65c8bfaac619.camel@ozlabs.org>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
From: Jeremy Kerr <jk@ozlabs.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Date: Wed, 24 Feb 2021 08:29:17 +0800
In-Reply-To: <e79d7306-c0d8-fbd2-9582-bfa169dd6289@ozlabs.ru>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <20210223123943.06d23a56@bahia.lan>
 <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
 <2915273.dLz0rCdnKo@silver>
 <e79d7306-c0d8-fbd2-9582-bfa169dd6289@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=jk@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexey,
> Jeremy or Stephen (cc-ing) do definitely know if there is a better
> way.

The standard process is to send me an email :)

You're wanting to add user 'groug' to the qemu project, is that
correct?

Cheers,


Jeremy


