Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB32F5588
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 01:22:13 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzqOy-00046y-K7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 19:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzqNk-0003ei-Aa
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzqNi-0005uX-1k
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610583652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99TF3q84HMnBvXkKX9tWB7QliE3lq2p32PZPn9bogNI=;
 b=DGywc7rjbzKtD8sZExHFvze0mHPQ712brPzqv0+QJb7lRpd8DHYYCxefL8qrJZ2Z9icmSU
 kWrFg5oPWTIES0hS4cCW52i+TwwsNRv12L2CVbd23fFXW72S3aI2D93SihNts7lwsMC28F
 euYOxMk2JjBwW35IAfdS5M4x4tTkK2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-G7eYyIB8PTmJ0RAryQHeVA-1; Wed, 13 Jan 2021 19:20:51 -0500
X-MC-Unique: G7eYyIB8PTmJ0RAryQHeVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 291D415720;
 Thu, 14 Jan 2021 00:20:50 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2EF6062F;
 Thu, 14 Jan 2021 00:20:43 +0000 (UTC)
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
From: John Snow <jsnow@redhat.com>
Message-ID: <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
Date: Wed, 13 Jan 2021 19:20:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 6:45 PM, BALATON Zoltan wrote:
> 
> Please don't. That would break all scripts that already call qemu using 
> single dash options. Forcing everyone to edit their scripts is not nice. 
> How about also accepting single dash in qemu-img for consistency then 
> you can use whatever you want in docs as long as single dash still works 
> for consistency and backward compatibility.

That's not what I meant -- I meant for documentation purposes. QEMU can 
keep accepting single dash, but we should standardize on the spelling 
for purposes of interactive messages, documentation, etc.

--js


