Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF12925F2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 12:37:01 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUSXE-0001CP-Td
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 06:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kUSW7-0000Jp-BB
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:35:51 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kUSW5-00086b-Hq
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=W1RUHZw9pdsCT87J0sVCWMG7QTKyKzlsZ0cKJM3KQVU=; b=OOa92Az3sjC3Si6Ux2f6agnzoa
 gzSkat1N7NLDm4ge5l9Gyt3mzHFqrofpFH9dg5N5PuPxXxpnb8lGSJMu5nVANjPr3te7IN9P3DG+3
 0smG9IH7lVWlv7fdE6Sh0kKet6aAd2nwV6qe67ELuvLPy7djDKrcbxnck7CWieCpAyQ0nXI7bu99G
 qao6yiZycuwFlMGzuf84C3jWsOHYubNPdNjqoOZHeNJ42AilaoMVgyOyxbxFLUV9HhflkzGZX93Ee
 Vk70MKtiZOx1RISGrvcwwAgtTFmSnWyYFfSTGn4XNh7CgY49nHTH9lmk4FasdYjJ7gnbxY7k0Z6aj
 jmXAYyBQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 01/12] libqos/qgraph: add qemu_name to QOSGraphNode
Date: Mon, 19 Oct 2020 12:35:45 +0200
Message-ID: <1689234.NbIpsrJQyj@silver>
In-Reply-To: <c9a6671914385d0ec6dcd3aee1371d73e09ee33a.1602182956.git.qemu_oss@crudebyte.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
 <c9a6671914385d0ec6dcd3aee1371d73e09ee33a.1602182956.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 06:27:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 8. Oktober 2020 20:34:56 CEST Christian Schoenebeck wrote:
> Add new member variable 'qemu_name' to struct QOSGraphNode.
> 
> This new member may be optionally set in case a different
> name for the node (which must always be a unique name) vs.
> its actually associated QEMU (QMP) device name is required.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/libqos/qgraph.c          | 1 +
>  tests/qtest/libqos/qgraph_internal.h | 1 +
>  2 files changed, 2 insertions(+)

So what shall happen with these libqos patches 1..7? Is that a nack, or 
postpone for now?

Best regards,
Christian Schoenebeck



