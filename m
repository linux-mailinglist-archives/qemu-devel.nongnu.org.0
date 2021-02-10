Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E7316CB5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:31:14 +0100 (CET)
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tKb-0008Fe-QW
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9swF-00013s-SX
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:06:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9swE-0006of-9s
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjLvbzBiQW6Ln87YjMd/QHk9WPSRLyKHKwvkQ/HDI84=;
 b=Xu159x6ANGYxgijw+2rcvsny8BRQ082v4KwRL73AF6fSLLFUqhWF5H7JipOULjB6hPsWD9
 yita1F4t2kW4ZnioC+Vy0ClPc+87BeVtHPXqTuEcQL8I4YuzBhd+7NbxjoTO4mRbKxO3ws
 7XXxNx8gXk7EeC9S7DnOZcdku5TcchI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-D5gq_GqfMQ27IcIw18DF6g-1; Wed, 10 Feb 2021 12:05:59 -0500
X-MC-Unique: D5gq_GqfMQ27IcIw18DF6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C67107ACE3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 17:05:58 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E30060C15;
 Wed, 10 Feb 2021 17:05:58 +0000 (UTC)
Subject: Re: [PATCH v5 12/15] qapi/introspect.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
 <20210204003207.2856909-13-jsnow@redhat.com>
 <87im723766.fsf@dusky.pond.sub.org>
 <eaa0ed74-226c-4268-9227-c19a704bb2a7@redhat.com>
 <878s7xvbuw.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <060065fa-f519-e823-17ba-08cd01e40a47@redhat.com>
Date: Wed, 10 Feb 2021 12:05:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s7xvbuw.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 4:17 AM, Markus Armbruster wrote:
> Let's stick stick to "type what we have", and also take notes on
> possible improvements for later.  We need this series to converge.

Yup. Consider the optional trailing patches my attempt at saying "Later, 
maybe?" as a genuine to-do and not dismissive "I will never do this! The 
fool! The rube!"

--js


