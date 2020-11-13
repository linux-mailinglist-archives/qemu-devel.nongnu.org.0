Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06832B1F83
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:05:54 +0100 (CET)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbaD-0004RM-Vf
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdbVp-0001Wt-PV
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdbVm-0002Of-BC
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605283277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=px9C9U84OJDLqbFirzrEP20zw4MKemCH4Buubo08UvA=;
 b=Ki43dXBztI8wD3GmDXUnU67+0dsTrEMrFVU1WG9Uhu0/goNsYFNv495v6pGQ532ow7Q9Oj
 9tDA/JdlFMx0lIg+igsR95m1j1ozInKyHZmu5bmFfKa/z51+T3KxgwuJzRBYBr2GKoPyMk
 Hol/xaxb8hLdghd4FJV6i295ItVhx5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-qw2l1o1GOTC2Pf9JcyMowg-1; Fri, 13 Nov 2020 11:01:14 -0500
X-MC-Unique: qw2l1o1GOTC2Pf9JcyMowg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20419804765;
 Fri, 13 Nov 2020 16:01:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-177.ams2.redhat.com [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4830E5C1C7;
 Fri, 13 Nov 2020 16:01:10 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Deprecate the nios2-linux-user target?
Message-ID: <511a36ae-3d76-e185-079a-ac3e89bcd9cd@redhat.com>
Date: Fri, 13 Nov 2020 17:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


 Hi all,

looking at some bug reports in the launchpad bug tracker:

https://bugs.launchpad.net/qemu/+bug/1791763
https://bugs.launchpad.net/qemu/+bug/1791796

... it seems like the nios2-linux-user target is rather broken and
neglected? Is anybody still using it? If not, should we mark it as deprecated?

 Thomas


