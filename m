Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE56B5366
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 22:51:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakcg-00076k-Ne; Fri, 10 Mar 2023 16:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pakcX-00076U-VV
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:49:50 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pakcW-0006v7-Dm
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CMHQdLhJRfInVpFxGTSLGFq5LTy1d2Tg84xtOzuS3O4=; b=dGcWl+68Q02cEba4IvB4j9lfGl
 YsjmsrSWLmN6HfyOYfQuVujYw1htNp7BbSt5Q3aHQMOP6kkAs5dYwqR0wVjOC67WhFzOOu9RB5TlA
 pmklJjpqRww8aignmLMJwLT55IcqaCS+x4S3yUKX+lPnP/Q3mAMKOTuK5S8/hjLIAxfI=;
Date: Fri, 10 Mar 2023 22:49:21 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, =?UTF-8?B?Tmlj?=
 =?UTF-8?B?Y29sw7I=?= Izzo <nizzo@rev.ng>, Paolo Montesel <babush@rev.ng>
Subject: Re: [PATCH v2 08/10] contrib/gitdm: add revng to domain map
Message-ID: <20230310224921.3df388a6@orange>
In-Reply-To: <20230310180332.2274827-9-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-9-alex.bennee@linaro.org>
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

On Fri, 10 Mar 2023 18:03:30 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> +rev.ng          revng

Please use "rev.ng Labs". Thanks!

Reviewed-by: Alessandro Di Federico <ale@rev.ng>

--=20
Alessandro Di Federico
rev.ng Labs

