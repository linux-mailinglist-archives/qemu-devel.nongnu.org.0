Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A8F21579
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 10:42:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRYRg-0006Ru-QO
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 04:42:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu_oss@crudebyte.com>) id 1hRYQE-0005Tm-Kb
	for qemu-devel@nongnu.org; Fri, 17 May 2019 04:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu_oss@crudebyte.com>) id 1hRYQD-0001Mh-DE
	for qemu-devel@nongnu.org; Fri, 17 May 2019 04:40:58 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
	id 1hRYQC-0001ET-MH
	for qemu-devel@nongnu.org; Fri, 17 May 2019 04:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zpfrIB247PkdhgMcDEn8FJ30/tqtWr8J9GsQDo8XUvc=;
	b=R4nW3QWDboXbFqtnigAIH5Mwnk
	S9ozXLqUTCy1zoEhGp3GN9j3jGfNqU6eXD3xCldJ1ffiJVGuPfvgqD1yG0eWnPgndtE4i3t8njNdj
	YbK4aHDc1NPI/b3XCn9wqzJYgoYQ1O4HBUTOkd0BeGIMghS5252Z5ztj+qhosbDAhRneG8zEFyTJG
	saJyuInudAkMCNAKNtd5rdukX15UAfQ8Ep7ORkeXHL4GwuTrt7K49oMakXdq4tGk7TF1SqvNqRLZj
	voXrOioT4/dhDEoQXV8804WKCMBgcYxpFmbltwA15QhA0aH1BgaMvOmjqKONKJ87aVzHXK3lmJlax
	ofju9VexMHhPs0RvQo565OmB0WMscXqIk97pmpXGNw/A8QxtcF8JWh0JDWSDQGHwsosduJgJ9HO7E
	+z54B7wBN1EA633RuL9USCyVooEtmfKnen8e+K2Pmmhrl84a5qlS1CbUl+Kg8bSbFJkCq4QHhuxb4
	dBh+BbLfVDBZYXmXvNlf3dPvc1TBf8pRIIP//6oTbYe4kZFwYhfXFLJbt+10gMP9N5VCAMH9As6sY
	MBOqQsT43eUSokJtuZgU0lWLWmtDh+a1swhYNcPSD7lC8fiutb0+Co2wMKV7JT+lfROPVoynyQf0a
	41g7Iang10gec3DcO0n4aq4AWIzPfLI4Mr8XkXmQY=;
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 10:40:48 +0200
Message-ID: <8706106.MIJVTSuNya@silver>
In-Reply-To: <1714809.tFt2Qa06yj@silver>
References: <590216e2666653bac21d950aaba98f87d0a53324.1557093245.git.qemu_oss@crudebyte.com>
	<20190507174239.59ad26d1@bahia.lan> <1714809.tFt2Qa06yj@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
Subject: Re: [Qemu-devel] [libvirt patch] qemu: adds support for virtfs 9p
 argument 'vii'
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
From: Christian Schoenebeck via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Greg Kurz <groug@kaod.org>, Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 7. Mai 2019 18:16:08 CEST Christian Schoenebeck wrote:
> Here are the archive links for latest v3 patch set [5(+1) patches total]:
> 
> [PATCH v3 0/5] 9p: Fix file ID collisions:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01143.html
> 
> [PATCH v3 1/5] 9p: mitigates most QID path collisions:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01142.html
> 
> [PATCH v3 2/5] 9P: trivial cleanup of QID path collision mitigation:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01140.html
> 
> [PATCH v3 3/5] 9p: persistency of QID path beyond reboots / suspensions:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01144.html
> 
> [PATCH v3 4/5] 9p: use variable length suffixes for inode mapping:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01141.html
> 
> [PATCH v3 5/5] 9p: adds virtfs 'vii' device parameter
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01138.html
> 
> And the optional libvirt patch:
> 
> [libvirt patch] qemu: adds support for virtfs 9p argument 'vii':
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01223.html
> 
> > > Please just have a glimpse on that v3 thread, and before I address the
> > > details that you requested (I have reviewed them all already and will
> > > address them), I would like you to ask you for a coarse feedback on
> > > design/features first.
> > 
> > > Because there are some things where I am unresolved on design level yet:
> > 
> > I'll try but probably not before next week.

Hi Greg, you have not forgotten about me, did you? ;-)

Or should I go ahead and provide a v4 next week addressing the issues 
discussed so far?

Best regards,
Christian Schoenebeck

