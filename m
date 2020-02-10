Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5219158352
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 20:11:38 +0100 (CET)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ET3-0000oy-Cn
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 14:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j1ES4-0000D8-V7
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 14:10:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j1ES3-0000dC-7P
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 14:10:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48639
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j1ES3-0000bA-4I
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 14:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581361834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc48t+6AI7AmfL86H9V0dNN8Uqt/W69NAg/TKGozIpE=;
 b=B3W2MqNTriteiZZqrS7ggEMhkum7OJR2gNSvNcr0K5qPK9hDlpRSqBVlzRux3LKdzSP+av
 MZ6P3WomJzZ1IiipAIa7UCphaSzz9zrWfyXVSIJm3FVUYm9H9yjNKhZprTcjnK/YGmhrPK
 MyvBZHR8+CpkB34q7NwPfmnZZ+ZNlAc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-UsVvzEiaMyS2UKn1sX7t7w-1; Mon, 10 Feb 2020 14:10:30 -0500
Received: by mail-wm1-f72.google.com with SMTP id u11so162861wmb.4
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 11:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vc48t+6AI7AmfL86H9V0dNN8Uqt/W69NAg/TKGozIpE=;
 b=uI19EIqhUNQi6qqHz62GxC5kLpyE9Q+1FOJLZhj7mY80bcyZphvAh10udPbOCEPqiI
 3hcsJMx95qPNCw5gTnyEHtJswY0jmMJFWUnB5niciZN20++KqTku0K8hFHb4qhCf19Y1
 I1BKndpDtPApsED0+6ojFSXC2eUidKiYxwVlJFhY7I0ZcalRB8HNFA18sLAdoysZ9iOt
 hq3soTsFs182SlLvPyHC2Papd1+AqXDSOYri29tVbD73yQ9qPtFMxfkFa8cWNC6h6VNC
 jWHcyoPfkqq8hTnEv1EXvt31lQJDdqKvqKYXVhZEjiJnaGpaRxy6d1kw8ZXzBjX6Hn2D
 2MrA==
X-Gm-Message-State: APjAAAXCdh4nSQaRRo9EgYIUvIPFtl5v5/20Alo0CJsuW/6Ha05vX1Cu
 mg4ygMKxvd+Udg1Ov4SV02cEQ+ZUyaJOgdK+HZtmz/7SiGprZSwzloklAtnHqHjHcxyXsBlqa1T
 t2AEaKiBkujmeSoI=
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr390626wme.125.1581361829061; 
 Mon, 10 Feb 2020 11:10:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEJ49fRTUG3c2X06NrTs3kBqkSot8j0c3Mb7Is/No0Wr/2mloktsJLeXKhX2zlz41Omdd7BA==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr390589wme.125.1581361828379; 
 Mon, 10 Feb 2020 11:10:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:50ec:2e9a:84be:2bbe?
 ([2001:b07:6468:f312:50ec:2e9a:84be:2bbe])
 by smtp.gmail.com with ESMTPSA id a8sm386919wmc.20.2020.02.10.11.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 11:10:27 -0800 (PST)
Subject: Re: [Libguestfs] [RFC] lib: allow to specify physical/logical block
 size for disks
To: "Richard W.M. Jones" <rjones@redhat.com>,
 Mykola Ivanets <stenavin@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <20200207232528.13461-1-stenavin@gmail.com>
 <20200210114316.GW3888@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af985d09-814c-da79-a245-8425f721dd8b@redhat.com>
Date: Mon, 10 Feb 2020 20:10:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200210114316.GW3888@redhat.com>
Content-Language: en-US
X-MC-Unique: UsVvzEiaMyS2UKn1sX7t7w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/02/20 12:43, Richard W.M. Jones wrote:
> So it appears that we should just have one blocksize control (maybe
> called "sectorsize"?) which sets both physical_block_size and
> logical_block_size to the same value.  It may also be worth enforcing
> that blocksize/sectorsize must be set to 512 or 4096 (which we can
> relax later if necessary).

Yes, physical_sector_size is basically a hint to the OS and is of rather
limited usefulness.

Paolo


