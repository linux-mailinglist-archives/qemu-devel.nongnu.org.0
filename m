Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE3E26D72D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 10:52:33 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIpea-0005Vc-KD
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 04:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kIpd2-0004Th-Mj
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 04:50:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kIpd0-0001Dk-JJ
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 04:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=Eo9IuZVUSWtKdK0E1ZUzvHLyqWo1joT9Xp+HIJ1eO+o=; b=nGSiX2puYe8BRhICtiVpHeiwSx
 nK2Z7ieTN/vW1vnBtByBOaS8+e5oQMQW5tftyJl4VQFy3Fqh1xacG6LclrSdNZeRVRh+b28TZ6Y2B
 3QP+X/jwBXTMMsLzS0py40IAOWe3xqyN+poXenhGwSoaVAao0xc1ENx1y5r+CHqif8f0HvN67nSuF
 Ze0INrQ/OoySMiyU1AHbiNqEQr/c5wTu/aXsYio0Fe+oh9pP+M0qybI4ECtVNgvhQRKqFNXqg3iwm
 BHReN5V2MHim30eTTDNTzUdHu3Ge6CvtVdyNrGWEtmtWhu3Sfe7kZ48HI/Ub46uPn8pb2+tz9R2ln
 dE98BxNg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: QEMU policy for real file tests
Date: Thu, 17 Sep 2020 10:50:46 +0200
Message-ID: <1836935.RIYQIvKipu@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 04:50:50
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

Hi,

is there a QEMU policy for test cases that create/write/read/delete real files 
and directories? E.g. should they be situated at a certain location and is any 
measure of sandboxing required?

Best regards,
Christian Schoenebeck




