Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBB62F67EE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:42:00 +0100 (CET)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06dC-0004rQ-Ue
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l06KZ-0003Kr-94
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:22:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l06KV-0005s3-Qq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610644957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzlkCDj5IrZ54tVqIIvom8jTXCuNvc4NkRXhzJhdEMk=;
 b=BuQM6mWWra7SZn/iUmDN4sP4uKtCkDCa5mLPzbO25gRyXi9fr5Zx9Tv46naqkXUSoHQTWX
 kpGjt13UFCq0rZqyQDfa88NCIRb5rZ6LBFAFCyRDlTX3T+1HPrPVCFTMmDzGMdF9+tG8j2
 lFo7PYM6WLFxpcff3fDcmHb8uM1xn7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-jn6S4RYXPjKighQZqUD8RQ-1; Thu, 14 Jan 2021 12:22:29 -0500
X-MC-Unique: jn6S4RYXPjKighQZqUD8RQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55569180A0A1;
 Thu, 14 Jan 2021 17:22:28 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB9CD19C71;
 Thu, 14 Jan 2021 17:22:24 +0000 (UTC)
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
 <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
 <20210114140217.GD292902@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <910813a6-7269-42cf-e369-7a9756e970bf@redhat.com>
Date: Thu, 14 Jan 2021 12:22:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114140217.GD292902@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 9:02 AM, Stefan Hajnoczi wrote:
> 
> 1. Add a section to CODING_STYLE.rst or other developer documentation
>     documenting this.
> 
> 2. Convert existing documentation to use '--'. This will make it more
>     consistent and also avoid confusion about '-' vs '--'.
> 
> John: Do you have time to do these things as part of your QEMU
> command-line and API improvement work?

I will add it to my todoist task list, but I am still neck deep in the 
QAPI forest, so it won't be a priority in the short term.

--js


