Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA74F0C36
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 20:46:34 +0200 (CEST)
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nb5FA-0006VY-1F
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 14:46:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaspard@courchinoux.org>)
 id 1nb5Cu-0005g7-65
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 14:44:12 -0400
Received: from [132.145.171.67] (port=35926 helo=mail.courchinoux.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaspard@courchinoux.org>)
 id 1nb5Cs-0006Qb-Ll
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 14:44:11 -0400
Received: from mail.courchinoux.org (mail.iredmail.org [127.0.0.1])
 by mail.courchinoux.org (Postfix) with ESMTP id 4KWjMP12kjz3ZTG
 for <qemu-devel@nongnu.org>; Sun,  3 Apr 2022 18:37:53 +0000 (GMT)
Authentication-Results: mail.courchinoux.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=courchinoux.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=courchinoux.org;
 h=content-transfer-encoding:content-type:message-id:user-agent
 :subject:to:from:date:mime-version; s=dkim; t=1649011072; x=
 1651603073; bh=in+ZopReVBNn+pbBV/Fn0gAiYD/jBFfv9FxloIc8VEM=; b=X
 q2Gwq/8abXCmBLYZQcNOE6Re0w9XdtOkkDgFESvnkmfK2p/ip3Hbmsnsyt8Lyl17
 P7hSTUfkX6bRbgnrzsqK5z0dQ+k3SknvJ4MmpJMnm3/mZNUd7J8fLiiFayYPb4mU
 fE5mcgyj3egM/sHDwHkrCq3PMaRIInGgiBeIMyoUqWtjlsh3CHvsPi/dH7PM//vY
 UggfKCNSKwVQTW0pqchR/FJvvOffjCg6Hc6O9S60Mxxfv3DaYlr1Moln/SQ8JrqB
 SP/S7Bf8NsaoEdvrZMtys5gUQGczjNkMmH413f9DvXZEmCoEU8xWwUJtGg1ArOUJ
 hT09UXFMnhojhvkwa/zGA==
X-Virus-Scanned: amavisd-new at mail.courchinoux.org
Received: from mail.courchinoux.org ([127.0.0.1])
 by mail.courchinoux.org (mail.courchinoux.org [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tws0QO9O--6o for <qemu-devel@nongnu.org>;
 Sun,  3 Apr 2022 18:37:52 +0000 (GMT)
Received: from localhost (mail.iredmail.org [127.0.0.1])
 by mail.courchinoux.org (Postfix) with ESMTPSA id 4KWjMN1CJ5z3ZTF
 for <qemu-devel@nongnu.org>; Sun,  3 Apr 2022 18:37:51 +0000 (GMT)
MIME-Version: 1.0
Date: Sun, 03 Apr 2022 20:37:51 +0200
From: gaspard@courchinoux.org
To: qemu-devel@nongnu.org
Subject: Question about  porting target.
User-Agent: Roundcube Webmail
Message-ID: <d9cfa7ed03fe98521078084340a4eae0@courchinoux.org>
X-Sender: gaspard@courchinoux.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 132.145.171.67 (failed)
Received-SPF: none client-ip=132.145.171.67;
 envelope-from=gaspard@courchinoux.org; helo=mail.courchinoux.org
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_05=-0.5, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi everyone,

I have a question,  does a guide or documentation exist  to porting new 
target to qemu ?
I have found in the list a very old topic about that , but it's  not 
very clear.

What files into target folder in the source  I need to modify ?
Because I can't find any guide or documentation .

Thanks in advance !

Gaspard C

