Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B7A65210D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 13:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7c6Q-0006N8-6C; Tue, 20 Dec 2022 07:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1p7c6N-0006Mo-8S
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 07:52:11 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1p7c6L-0005ow-0j
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 07:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lU8gZixlEe3IZrO4eNvbzExtfTDZyg+4wfp1S2s9Kpc=; b=pxrWa966ACI5eLSvBkDgNpqO/p
 WPmNvkSTFgt1ud3Qea/L3jrnH6RhL2KU4AaITDwp3/wnTNjt7LD6hOHmkTHZYUPVQHK0MdDyFkYCF
 fI3CJZcqQDS4J9dC5hRzixUScMcJe5PWTIvSGF22fGK0UAG1f6x/UuhqALRUt72oMc7E=;
Date: Tue, 20 Dec 2022 13:51:51 +0100
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org, Paolo
 Montesel <babush@rev.ng>, Anton Johansson <anjo@rev.ng>,
 richard.henderson@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Message-ID: <20221220135151.1e5394b9@orange>
In-Reply-To: <144e9b21-3bcc-4519-bdc7-4293f2c4af90@linaro.org>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <efcdbcb2-87c3-870f-5462-fad7a276de7a@linaro.org>
 <144e9b21-3bcc-4519-bdc7-4293f2c4af90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 20 Dec 2022 08:30:02 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Do we really need this level? IIUC the problem with -Wextra is using a
> newer compiler toolchain it can include warnings we haven't fixed.
> Maybe worthwhile but it can break from times to times.

I think we just wanted to be overly zealous.
Flags typically used by QEMU are fine.

Shall I send a patch to drop -Wextra?

--=20
Alessandro Di Federico
rev.ng Labs

