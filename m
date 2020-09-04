Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41A25D6EC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:00:32 +0200 (CEST)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE9SJ-00035S-D2
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kE9RP-0002Yn-M8; Fri, 04 Sep 2020 06:59:35 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kE9RM-000867-C1; Fri, 04 Sep 2020 06:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xfZanjgFriF7N3lCLV4ytaU71ym99aPSkt0Xx8bh4+Q=; b=MZqidH33dwzds9VfXIT4NpHN9f
 g4SZ+KqpeVvVkkGSxW0z++4mZdzcNCesBjmIvAuEUTdGPnl6kntzEbgsHdXxbtSdzlUZV41cZg7aD
 hWZkhtP4TJaQB6+6HHa7xBw7AU2+/xfWRsLKy+7uy2fUQmYk6TwGV6jpy+V4ReRBLiYWRS0NDCBLO
 byBF2qfe4a9VpGkmKe8vpBQmGZUjsoV2oW7+1qVqrMZkICplbRn14bD683o98EmMm2/JMTDFuZn++
 G3RNYQfr9rSKdOLRg/RCqAksMgh0S/I/aRMS0iCTy0zTkc9QjsvcEvQhaAktiC7gN2QJCy+5oMcOd
 /4a1dcGg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 15/77] xen/9pfs: yield when there isn't enough room on the
 ring
Date: Fri, 04 Sep 2020 12:59:26 +0200
Message-ID: <3404354.Slp6BcXW21@silver>
In-Reply-To: <20200903205935.27832-16-mdroth@linux.vnet.ibm.com>
References: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
 <20200903205935.27832-16-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 06:59:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

Additional candidate:

353b5a91cc 9p: null terminate fs driver options list

Best regards,
Christian Schoenebeck



