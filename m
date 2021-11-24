Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920145CB4C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:41:52 +0100 (CET)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpwHH-0003Yq-Cp
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mpw3v-0003EW-SL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:28:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mpw3r-0008TX-9O
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637774877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPGUI4XmKI0Zkv+Gr2GajWLam3lETzGC+9jWesZyFJM=;
 b=bA1TwPITYStVrPitm6TxT/poRO22hUTzU2dhRZ2Wx7N99ZOhnbmUDbiVeN4z69nBCydeCL
 6s/k8NTrpXcuw2tqEEPsro4uAA07STEfyhSNvtCkE/jELqR2s/xhBwm9oWb16Q/Ka/Pw1+
 9z/E+ceiH52HK9kSUO30z8u2N1F6U90=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-vY_ZiDVzN7u_0mHga_8C-g-1; Wed, 24 Nov 2021 12:27:56 -0500
X-MC-Unique: vY_ZiDVzN7u_0mHga_8C-g-1
Received: by mail-qk1-f197.google.com with SMTP id
 az44-20020a05620a172c00b0046a828b4684so2665193qkb.22
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 09:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=RPGUI4XmKI0Zkv+Gr2GajWLam3lETzGC+9jWesZyFJM=;
 b=yTfVRzsdQw1gFh3qst0BR9tv0zSCIhjkE5mWjQwL0h7J4w56pGoB3lJtf8VbL88QM8
 QTmmEt6qI377KkksCYepg2uDFqSYP78039AKkJmyp3FMLtLJOoPTRDrB/U/w/ykpmycG
 Tu5ENpzBxgVX73RHaf9zLisUgJ9xKahlFTW9jQhi7uo571sd1PSCHzb6csgFMxSd1MUv
 358AoN9nkEK7uu7ZCg5DUSRKINiiVXuhO7E+XOGtfdxBf0MQdfTJ6kZP5fAI1Cgnsnb3
 2oBfya/DA/kDE5Jo0ZQgYd2wFtxD8vnZCXgH3/cTgxAZm6yDJB9hdwpVZAundbZ65sJK
 jWFA==
X-Gm-Message-State: AOAM533CJ44HP7n6CbSgIha0SPKj9+fZyxycbcOOT2cK38hqazOL52Dn
 iKXKXm9ymCpoike8HGVW3gjtcDQaJ/q9vBmLHTsEbS2j95he00iXsHhwx9X4k8mqRtw24afaMMY
 G7Vvtqv6P2xPvUjoz5We25iRsvIJY9ZciQ2coP4vvGh2NaY9pMVT7NfVE0lPv+OvExRE=
X-Received: by 2002:a37:a590:: with SMTP id o138mr7669711qke.174.1637774875743; 
 Wed, 24 Nov 2021 09:27:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlcE+fHzWt7t9c0wNa/blVURyDnXmRifCVTX7jxmeTVlmuFkhFmdPrMf9YZ3NMrx/++uF21Q==
X-Received: by 2002:a37:a590:: with SMTP id o138mr7669675qke.174.1637774875495; 
 Wed, 24 Nov 2021 09:27:55 -0800 (PST)
Received: from [192.168.1.234] (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id 196sm161246qkd.61.2021.11.24.09.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 09:27:55 -0800 (PST)
Message-ID: <ba7c1207-a166-0b1e-8014-a82f0a003c9d@redhat.com>
Date: Wed, 24 Nov 2021 12:27:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: SEV guest attestation
From: Tyler Fanelli <tfanelli@redhat.com>
To: qemu-devel@nongnu.org
References: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
In-Reply-To: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Ferlan <jferlan@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 11:34 AM, Tyler Fanelli wrote:
> We recently discussed a way for remote SEV guest attestation through QEMU.

For those interested, here is where some of the discussion took place 
before.

[1] https://listman.redhat.com/archives/libvir-list/2021-May/msg00196.html

[2] 
https://listman.redhat.com/archives/libvir-list/2021-October/msg01052.html


Tyler.

-- 
Tyler Fanelli (tfanelli)


