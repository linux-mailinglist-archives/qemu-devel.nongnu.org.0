Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5B199950
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 17:12:49 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJIZM-0006oK-CY
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 11:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jJIUk-0008OC-HT
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jJIUj-0008Oi-7Z
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:08:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39621
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jJIUj-0008OI-42
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585667280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZI6ZWDlyXnpjwUIr7sBRa5x+lgCmRA0UTkCASxf4tA=;
 b=S5q/1Opz7SWp93s9jwhqrwMZfLhUTtKVXY+0cVCnybaeKAq5esX4aXou0BOn68zHekMbaS
 MqKnwPWkdIn1rhZ7M4QY+Rgc7Zl+BGlTnh2U0GfD4pGKBWASCHo9ADFqvN7D4wQ2QKB1uJ
 P0UV9H4hz/Bd2vuIVnPQDyxZ1I8/yEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-vh_pEtfEOym-P9hOoa5dSg-1; Tue, 31 Mar 2020 11:07:58 -0400
X-MC-Unique: vh_pEtfEOym-P9hOoa5dSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D9AC18C43C0;
 Tue, 31 Mar 2020 15:07:57 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-236.ams2.redhat.com [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 733FC60BFE;
 Tue, 31 Mar 2020 15:07:55 +0000 (UTC)
Date: Tue, 31 Mar 2020 17:07:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v10 00/14] iotests: use python logging
Message-ID: <20200331150753.GH7030@linux.fritz.box>
References: <20200331000014.11581-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200331000014.11581-1-jsnow@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: ehabkost@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.03.2020 um 02:00 hat John Snow geschrieben:
> This series uses python logging to enable output conditionally on
> iotests.log(). We unify an initialization call (which also enables
> debugging output for those tests with -d) and then make the switch
> inside of iotests.
>=20
> It will help alleviate the need to create logged/unlogged versions
> of all the various helpers we have made.
>=20
> Also, I got lost and accidentally delinted iotests while I was here.
> Sorry about that. By version 9, it's now the overwhelming focus of
> this series. No good deed, etc.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


