Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3130CE3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:55:35 +0100 (CET)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l73e1-0004At-MZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l73d4-0003k6-1Y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:54:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l73d0-0006wj-OM
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612302868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaBWNcxqUKepj39chP5kS4mK1ZBU7bifOsvRIOjTdDE=;
 b=NQ9sIyhg2TQyJ6ROSw+Z0UqI2O+9jXnbTNhCNnPJ68pVLrHTC0Lqcu6arH79qZ0yualyZ1
 SqH0y1cEicLmRdp59OkJk0XgmlN55CWiq+bqa55pXlSkJX2aW9EqxxYOGQji1o19+GbhN3
 OHK4wJRrfFlRngYhC0zhQHwhJQUispE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-C0ixmkgrNlSL80iyZCxROg-1; Tue, 02 Feb 2021 16:54:26 -0500
X-MC-Unique: C0ixmkgrNlSL80iyZCxROg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C29761846092
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 21:54:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-67.ams2.redhat.com [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF3CE165;
 Tue,  2 Feb 2021 21:54:24 +0000 (UTC)
Subject: Re: [PATCH] device-crash-test: Remove problematic language
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210202191207.4103973-1-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bd5e6924-4253-4ed7-7a42-d075a44c9897@redhat.com>
Date: Tue, 2 Feb 2021 22:54:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210202191207.4103973-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/2021 20.12, Eduardo Habkost wrote:
> Replace "whitelist" in the device-crash-test script with
> "rule list".
> 
> I'm using "rule list" instead of "allow list" or "pass list"
> because the list is not used only for expected/allowed errors.
> It also contain rules specifying which errors shouldn't be
> ignored and/or should be fatal.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>   scripts/device-crash-test | 96 +++++++++++++++++++--------------------
>   1 file changed, 48 insertions(+), 48 deletions(-)

Good idea.

Acked-by: Thomas Huth <thuth@redhat.com>


