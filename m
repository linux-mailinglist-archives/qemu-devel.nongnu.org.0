Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB12BDFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 16:20:23 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD89W-0002xi-6d
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 10:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iD6CW-000132-Gc
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iD6CV-0007l3-Gc
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:15:20 -0400
Received: from charlie.dont.surf ([128.199.63.193]:40462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>) id 1iD6CV-0007kd-Am
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:15:19 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 0DF3CBF722;
 Wed, 25 Sep 2019 12:15:16 +0000 (UTC)
Date: Wed, 25 Sep 2019 14:15:13 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH 16/16] nvme: support multiple
 namespaces
Message-ID: <20190925121513.GA226870@apples.localdomain>
References: <c60e88d4912848148ce74b574e7dc51e@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c60e88d4912848148ce74b574e7dc51e@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
X-Mailman-Approved-At: Wed, 25 Sep 2019 10:17:01 -0400
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 25, 2019 at 11:33:45AM +0000, Paul Durrant wrote:
> Hi Klaus,
> 
>   I may have missed something but are you planning a v2 of your
>   nvme_ns series soon? I just ran into another issue with this version
>   when trying to use non-consecutive nsid value; the code uses an
>   array of ns indexed by the nsid, and using non-consecutive values
>   causes it to wander off the end of the array when trying to look up
>   an ns by nsid.
> 

Hi Paul,

Yes, v2 will be served momentarily!

The issue you are describing is fixed in my tree!


Thanks,
Klaus

