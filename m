Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8804384BA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:38:45 +0200 (CEST)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLum-0006Wb-Vd
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnq-0005DX-9B; Sat, 23 Oct 2021 14:31:34 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:36341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnn-0006X9-Le; Sat, 23 Oct 2021 14:31:33 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mw99Y-1muugE43Fs-00s4y4; Sat, 23
 Oct 2021 20:31:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] MAINTAINERS: Add myself as reviewer of 'Machine core' API
Date: Sat, 23 Oct 2021 20:31:16 +0200
Message-Id: <20211023183123.813116-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BvcAaw+R/IwhQ4xfQkGCnhA5wh/x5okd9ZFDYBS3QRl8/mHhl6q
 ffJeq12APrx2mcYaKuNUUwVRchX5wfuDZMzPMZeQeZlET3SbdgmBqtxhau9wUQDMwYZEum8
 VJ/8JmqZP73TUhGgpd4iRTxhe1gzInDoDGlulQ30Ou9RRwey109E7nWb3q4u+vy6NFxsgAt
 5BBRfbF+dfMmZIXBw1zdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3o8ni+6GUSw=:d8dCzrCjqKLIYW9yu79q1f
 AV98GARjT2extYWcw67fQG+H4/C/iFKgnDuAO0OzestQlzBtoiP5gK9bwe3UfnN4qn3NO2SVf
 iyMQz1KtOR/k6RvVQoBNukFYNnuVfQ0QG44jIORamE5E+Kbg8r+hIxR8K89hbeBQdaoo3oqm2
 iDE2x/woih2zVbv1ZLXir73SesJ1fxa/ZWaYEKP5JH8EgREwrvzBb4Gt7e16R++S+PvnP8yDN
 dk1fXu2b9+OoqPKqGr8ZHldaWglmuh4CNCX9OeJU5bIgFfr7jEOiEIrqnAkFi39nTUrvkOfG9
 M06sdpKWWabRM4nqbNii5VTXZZaqkf2I+OJFXbh0TqGJKeQh/OEpTfpunR5RTk/3GP41Q27el
 dpYXCfhAcCP11wjun9fZiZWbYofiy8zsYdO67Kjg8JVP8jPyQe+vqyQonLUBxCwF5a/dCfYuR
 HMCocwSp9KOa46x9DmK5/s4gIaYGc9oqDCHt0brVx1/OCMyQTDqfSRUT9C2JM7h6VxO76pn1E
 TR+joYRwrFSrUlDwxAbqjTpBF6nV8+E4+139XxTElnLG9D+r2RXV1A941Y6gmdEEssjh/RCEc
 Y2GCtduqvt4wyj4D4gPq/JI9aTs7tIv8eZNiKb2A2ZlkCVEA/pvtMYznegQxhSvRLzYSITi/b
 7Io9f/cvcix0QPSoNZZ6v2Lk2PcqLMzYmVi5JvSqhpfBmLOp8KR4tSFtz9viD3zENBf0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In order to help Eduardo and Marcel with the machine
core API, add myself as reviewer. That will also help
me to learn more about this subsystem :)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20211007093108.323223-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e77d03651bb..894dc4310526 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1617,6 +1617,7 @@ F: pc-bios/bios-microvm.bin
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
-- 
2.31.1


