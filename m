Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958162409E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 20:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSnFi-0006fI-63
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 14:43:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hSnEe-0006Fq-N7
	for qemu-devel@nongnu.org; Mon, 20 May 2019 14:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hSnEd-0003WA-BI
	for qemu-devel@nongnu.org; Mon, 20 May 2019 14:42:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hSnEd-0003CI-5V
	for qemu-devel@nongnu.org; Mon, 20 May 2019 14:42:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47CA330BB524;
	Mon, 20 May 2019 18:41:20 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBB8C1001E86;
	Mon, 20 May 2019 18:41:11 +0000 (UTC)
Date: Mon, 20 May 2019 15:41:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Gabriel Barreto <sbarreto.gabriel@gmail.com>
Message-ID: <20190520184108.GA10764@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 20 May 2019 18:41:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] Introducing GSoC project: API Documentation Generation
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	"Emilio G. Cota" <cota@braap.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please welcome GSoC student Gabriel Barreto.  Gabriel is going to
work on QEMU API Documentation Generation[1].

Gabriel's first task is to evaluate our options for extract doc
comments from C source code and integrate them into Sphinx
documentation.  I saw that Peter has experimented with kernel-doc
in the past[2][3].  Has anybody evaluated other alternatives?
(e.g. Hawkmoth[4])

[1] https://wiki.qemu.org/Google_Summer_of_Code_2019#API_documentation_generation
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg411643.html
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg411841.html
[4] https://readthedocs.org/projects/hawkmoth/

-- 
Eduardo

