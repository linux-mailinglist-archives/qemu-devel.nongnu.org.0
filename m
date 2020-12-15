Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83D2DB0B5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:00:15 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCkI-0004u0-UE
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kpCio-0004Di-D9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kpCil-0007IN-KD
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608047918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIGX7eCasJIp3hrZUwLlKgrg+aiu+44mUlv09V8Izbc=;
 b=FwTZXBhLn2TzCS9EaTRzcSbNRRHX20K1ITSKXU3Z34csQLdD4nPLNPmnQyqrchjsbZcVy5
 WAK8NE3F3reOrsNZ+/Ddbz6KGcaBRxQkN8sHnLb3do5LomXhAKITwOpgeOygREpJyaCMyt
 CmtK90rsDZZAz/2XQKxXljRXxhMqR/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-3yS7hYQxP16jkfQNbqtUog-1; Tue, 15 Dec 2020 10:58:33 -0500
X-MC-Unique: 3yS7hYQxP16jkfQNbqtUog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75357195D572;
 Tue, 15 Dec 2020 15:58:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-32.ams2.redhat.com
 [10.36.117.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B8119C44;
 Tue, 15 Dec 2020 15:58:31 +0000 (UTC)
Subject: Re: [PATCH] iotests: Quote $cmd in _send_qemu_cmd
To: Kevin Wolf <kwolf@redhat.com>
References: <20201214175837.301658-1-mreitz@redhat.com>
 <20201215114320.GB8185@merkur.fritz.box>
 <61dede63-7561-88a7-312e-ec5babf667a1@redhat.com>
 <20201215154933.GG8185@merkur.fritz.box>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d58a3d43-5f56-d461-143f-c290f2383e83@redhat.com>
Date: Tue, 15 Dec 2020 16:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215154933.GG8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.12.20 16:49, Kevin Wolf wrote:

[...]

> Ah, looks like you don't even need to quote it like cmd="$1"? Maybe I
> should learn bash sometime...

No, normally you don’t, which is the reason why the "cmd=${$@: x:y}" 
line wasn’t quoted so far.  (Probably a bug in bash that was then fixed 
in 5.1.)

> But yes, this is what I was thinking of.

OK, I’ll cook up a v2 then.

Max


