Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42F26C4A7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 17:56:43 +0200 (CEST)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIZnW-00013g-Mb
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 11:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIZef-0002Em-B4
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 11:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIZea-00024L-6h
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 11:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600271244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MIEFbzKNDWvR2w6hiQFtDSGKL+6rMTzcTAEkujfFc+I=;
 b=DD60h85Wh/SA4YOHCoSWkJ1qJFNYrrF+QFQOMXs6aCyWkIAE+Okj6iiL8TV+lpIFjrv6yF
 NqVqep66xHj5LLTow3+4wUHGLmwQkeqttWzQ1/HpAHx064yHrE1Y/h0NO1BGNqIvoyyf0q
 LQcqiPkhQcrBa1bvMhlSQTVTc9eZQMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-VtBbTU2iPaK60669JW1_Cg-1; Wed, 16 Sep 2020 11:47:23 -0400
X-MC-Unique: VtBbTU2iPaK60669JW1_Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36BE61008550
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 15:47:22 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06BAE7880F
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 15:47:21 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Snow <jsnow@redhat.com>
Subject: Python docstrings and licensing/authorship
Message-ID: <361aad7f-c2a3-524e-bd5a-2fc1fa6fe38a@redhat.com>
Date: Wed, 16 Sep 2020 11:47:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:35:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some of the Python cleanup work I am doing, I am moving preamble 
comments into docstrings. These docstrings are visible in interactive 
editors and may be visible when using Sphinx to generate documentation 
manuals for Python code.

My instinct is to remove the licensing and authorship information from 
the preamble and leave the docstring only with information functionally 
relevant to the module, while leaving licensing and authorship 
information in a comment (above? below?).

The end effect would be that using e.g. `help(qapi.parser)` in the 
interactive Python shell would not show licensing or copyright for the 
module, but it would still be visible in the source file, as always.

Is this in bad taste? Do we have strong feelings about authorship and 
licensing being visible in help output and generated documentation?

--js


