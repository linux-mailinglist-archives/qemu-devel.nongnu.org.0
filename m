Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA92FD5AC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:30:19 +0100 (CET)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GN8-0002ql-42
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2GFB-0003sT-WC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:22:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2GFA-0004jR-KP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611159723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKRTrgoxJh9Jndci+AfmV7dPf5TpJHAIISS43qArUkI=;
 b=K4Dwi0IctgFNfVEKH0XhXJB+FtDnMWdu52VF6th6ZuWREIppzJna4HDEpqhMcPHAw3S9Ba
 g//NgWzcJb89PsxfPABM74tFMA4j1wh/bGF+B+8WZJH2k6S/6ZdgyWc9wJL5s9Ed2oalvu
 WUHgbZtCO32tsMqxxbW1pZ2a814y8ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-YleX0WyROOSdvXB8cYF5QQ-1; Wed, 20 Jan 2021 11:21:59 -0500
X-MC-Unique: YleX0WyROOSdvXB8cYF5QQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBFBB107ACE3;
 Wed, 20 Jan 2021 16:21:57 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74B7760D06;
 Wed, 20 Jan 2021 16:21:54 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] scsi/utils: Rename 'illegal request' -> 'invalid
 request'
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210120153522.1173897-1-philmd@redhat.com>
 <20210120153522.1173897-2-philmd@redhat.com>
 <20210120161506.2nuufcbiibgczpzu@sirius.home.kraxel.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2f6428cc-bf7e-6cc7-ef27-5a9b9e5d9822@redhat.com>
Date: Wed, 20 Jan 2021 10:21:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120161506.2nuufcbiibgczpzu@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 10:15 AM, Gerd Hoffmann wrote:
> On Wed, Jan 20, 2021 at 04:35:20PM +0100, Philippe Mathieu-Daudé wrote:
>> While these requests are invalid, they are not breaking any laws :)
>> Rename 'illegal request' as 'invalid request'.
> 
> Given the scsi spec calls this "illegal request" I think it makes sense
> to *not* change this and stay consistent with the spec for better
> grep-ability.  Note the variables are already renamed, I expect the
> comments have been left as-is intentionally ...

Consistency with the spec and grep-ability takes precedence over any pet
peeves of mine.  I'm fine if we disregard this patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


