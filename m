Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201847329F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 18:02:22 +0100 (CET)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwoiT-0002hT-FD
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 12:02:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joerg@thalheim.io>) id 1mwofT-0000c3-Th
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 11:59:15 -0500
Received: from mail.thalheim.io ([95.216.112.61]:33785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joerg@thalheim.io>) id 1mwofQ-0007Lm-T2
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 11:59:15 -0500
Received: from mail.thalheim.io (eve.i [IPv6:2a01:4f9:2b:1605::1])
 by mail.thalheim.io (Postfix) with ESMTPSA id 9EB1361B8A7
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalheim.io; s=default;
 t=1639414749; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=x9tOhuje2mUx15oj21hgk2t+eQoQPgmnPwrsVuRHLOc=;
 b=UayQ+/yHSXW2FzkWt9ig+1aou+wpwo3JFqppYgkgCHXWStdaW0frg2YeYqNHTU/b3oLkd6
 SoVlxl0zEMQZ0B8+XdBwSNoRT4p1DWOI2Oez5ory72A4nphwXmQneJ8NlgqAA0VyfaPR4E
 vZulPLqil/SFBIH436tZHCBHFpL5380=
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 16:59:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.16.0
From: "=?utf-8?B?SsO2cmcgVGhhbGhlaW0=?=" <joerg@thalheim.io>
Message-ID: <62b9be0d0cecd85204d94a3872cb6524@thalheim.io>
Subject: Re: [PATCH] hw/i386: fix phys-bits on cpus with AMD SEV/SMD
To: qemu-devel@nongnu.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=joerg@higgsboson.tk smtp.mailfrom=joerg@thalheim.io
Received-SPF: pass client-ip=95.216.112.61; envelope-from=joerg@thalheim.io;
 helo=mail.thalheim.io
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: 0b3132692ee53e98082b4dd12e41b4a3@thalheim.io
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Friendly bump.

