Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFE2DD63
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 14:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVxxN-0003eT-KZ
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 08:45:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Natalia.Fursova@ispras.ru>) id 1hVxDA-0004Ig-N4
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Natalia.Fursova@ispras.ru>) id 1hVxD9-0007e9-JH
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:57:40 -0400
Received: from mail.ispras.ru ([83.149.199.45]:51394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Natalia.Fursova@ispras.ru>) id 1hVxD9-0007cv-8z
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:57:39 -0400
Received: from NATALIAFURSOVA (unknown [85.142.117.226])
	by mail.ispras.ru (Postfix) with ESMTPSA id 3F566540089;
	Wed, 29 May 2019 14:57:37 +0300 (MSK)
From: =?koi8-r?B?7sHUwczY0SDm1dLTz9fB?= <Natalia.Fursova@ispras.ru>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>,
	=?koi8-r?B?8MHbwQ==?= <Pavel.Dovgaluk@ispras.ru>
Date: Wed, 29 May 2019 14:56:50 +0300
Message-ID: <002801d51615$99c0eea0$cd42cbe0$@Fursova@ispras.ru>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
thread-index: AdUWFZgjwxE4OQxbTXG9Tx3j6WX9aQ==
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
X-Mailman-Approved-At: Wed, 29 May 2019 08:41:52 -0400
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] qgraph
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, Paolo!

 

We develop GUI for Qemu and want to implement graphical interface for
configuring the device tree. To do this we need to detect list of the
devices supported by any specific platform.

Then we use this tree for command line generation.

 

Existing qmp commands don't supply enough information to build the tree.
They miss bus and interface data.

 

There is something called 'qgraph' in Qemu. It looks similar to data
structures in our GUI tool.

 

Tell me please, do you have a plan on improving this interface? We found the
following hardcoded lines in the tests:

qos_node_consumes("megasas", "pci-bus", &opts);

qos_node_produces("megasas", "pci-device");

 

And we wanted to extend QMP to query this kind of information.

 

 

Best regards, 

Natalia

 

