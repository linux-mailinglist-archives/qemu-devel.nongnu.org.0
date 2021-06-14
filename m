Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E33A6AFF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:53:54 +0200 (CEST)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsouP-0001OW-RN
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lsoFW-0003SN-GL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lsoFS-0000yd-2p
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623683493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mMMy7WrvshjubbH4YUkxMQFB8HAif5Posk4I+GTFTg=;
 b=jVAKJDvU2brPiRlJLby9IPUCm2izS/D62N7Solz54Iy3P5XQg94nFbwSpXEGwt+M+MgAHD
 qdDg4+iUV/QIwc2uAXl4I5wFTnLnemD1m4MX7mbxrutLSfA+1ov62lbwjhVhn+jP6Afgs2
 zDrzrG6PeToLxpVfvIMAuSOBSIsq+Y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-H4HPU6bSOVe6XHYDABgx7g-1; Mon, 14 Jun 2021 11:11:31 -0400
X-MC-Unique: H4HPU6bSOVe6XHYDABgx7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4E11940937;
 Mon, 14 Jun 2021 15:11:30 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F38A5D9F2;
 Mon, 14 Jun 2021 15:11:30 +0000 (UTC)
Subject: Re: [gitlab] Renamed issue labels for target architecture
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b82ba407-ac08-3dfb-2f3c-7677a4352e29@redhat.com>
Date: Mon, 14 Jun 2021 11:11:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/21 6:32 PM, Richard Henderson wrote:
> I've renamed arch:* to target:* as there was some amount of confusion as 
> to what "arch" really meant without context.  I've removed labels for 
> lm32 and unicore32 which have been removed from qemu 6.1.  I've added a 
> label for hexagon.
> 
> I have not yet added labels for host architecture, because I couldn't 
> figure out how best to word the description, or even if all of the 
> target:* labels need re-wording to emphasize target.
> 
> And then there's the special case of TCI.
> 
> Thoughts on these?
> 
> 
> r~
> 

Well, it would have been nice to have been asked first, seeing as I have 
done most of the labeling work to sift through issues.

The way the label had been being used was for both the host *and* guest, 
because we had thought that fully replicating all architectures for both 
host/guest tags wouldn't scale well.

I realize it is helpful to be able to search for the difference between 
them, so it's fine -- but it means I have to re-audit all the labels 
we've done so far so that they aren't now ... wrong.

--js


