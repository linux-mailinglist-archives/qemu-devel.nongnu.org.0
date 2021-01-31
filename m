Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B225C309E30
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:25:29 +0100 (CET)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6HPb-00028k-UF
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6HOE-0001iC-6S
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 13:24:02 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6HO9-00014x-UE
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 13:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=torjJjpzGYRXM/vW+m5kV3w39/CMnH3vepuV72TQ2so=; b=U1WPEHTiC+cDFiBm9O+Pm1cs5/
 X5QCLgMOyr1S6hL0gUKTe8Xp70YqZkPnQCe13Hp6pmH8KudEKwp0HCqVOO0wih6ajpDKIeL5BaamN
 iF8U1qWrfDjKZLaIPzCUqd44tT5ei3btk/XUClsTsf44CJCEH4ssH+3uyn/aGJCIy52HhIQGUYPg6
 x3ymoHAcpnOwNvmTNRhoYNxGAupJQK0VZiUajAIrc5736FOCtvzAQShDgxS0rI1+6Om2NR+fFUpzK
 VZfbMrnoPzyJAuMzHvaGtUgA7W2SqvwX7fP6XCaATFqV3mSDzz7kgxqhHpZLOdtB/Watm/TrOQsc7
 5Jtv/HUtH8UGScNS8dtC4LCmaRK+8kP6MOOA0KvlCFG/GpmEkUiWRJ3elQYxLf5CWG8y3FuijubEz
 tTqjrcjWrPQLC98uJ8IYMBGBxg+vlQ/UqbTGE+WSpnmcjPSD3JUKrtpb2NWFcTDxu2FdLGScJU3xn
 +MO6XkTsyGxPu9gL15NU8u7DwITCDLAIJEQOwwcnTLlHs10kyyrk9eQcvNnB2XV0fKcrJUEh7Mtvn
 OL5heTPhEVVt5qNkmMYaUeqy+XuzqrSNyjF0HF7zm/N7g+Swo8JaBi4RGAICap0mOOEz08tDgdDMn
 7FoyJtzRF9+VoQCvP7aQR4vEfaNarIbJQq2nO8YcA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: 9pfs developers docs
Date: Sun, 31 Jan 2021 19:23:52 +0100
Message-ID: <3475760.T70ipHyFzN@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I started setting up some developer documentation for 9pfs:

	https://wiki.qemu.org/Documentation/9p

Still quite a bunch that should be added (e.g. there should be a section about 
threads and coroutines), but at least it's a start ...

Best regards,
Christian Schoenebeck





