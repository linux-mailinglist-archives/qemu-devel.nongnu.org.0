Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B600C1A75AF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 10:17:41 +0200 (CEST)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOGlI-0004YU-Kx
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 04:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jOGkJ-0003cF-QJ
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jOGkH-0007ZH-0U
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:16:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29236
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jOGkG-0007Yf-0e
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586852194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sy6uAR1rELV1vmxwk+Aj9GqBHwm+5jXr2BPz/R/wWII=;
 b=a+MCmBrlYC1vrEb/Hs5V7X6vfEGY7QhcrKFvGitI6PekjeX9ZY+nHksHhH/ZrQGOH6I7k4
 PQeOolLVorb89c+M8W7zJi0mRkZ2N8qNmr6ZAnBJMGFDkVFvKiIDstEp7h87sRMha8fnWB
 16P4asRd4MVH6xOrtf93ppHTwli1imA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-1j5zG5_IM6iOMWc7ozpZNg-1; Tue, 14 Apr 2020 04:16:30 -0400
X-MC-Unique: 1j5zG5_IM6iOMWc7ozpZNg-1
Received: by mail-wr1-f71.google.com with SMTP id h14so8270177wrr.12
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 01:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sy6uAR1rELV1vmxwk+Aj9GqBHwm+5jXr2BPz/R/wWII=;
 b=Cp5tbsXTNZeA4UMkid1lzAbV9nPHuw4dmlHCVW7Xr73Lbu8srAmo+TcELReidUeSuF
 7FsFCxhppg+L7jIslVPHgRdSGAniCqv3NMnWkWy3a9RvWHcwZAgRYw/gFzMXGT7EL+J5
 j6Kwx9w0fzPNr63Blhf+Sy8VzrtMxGTyGuqfxRYhuH7FRqdDcLofwY3iFFjmhfVAfxA7
 OSAanhIM8JES7cAQFktdnb+gpcwCmHZL+YnboQNqgPTZRrYQq0ewtqlpksDQJWtTZ6My
 SMGJrvcW7AiZi4KOZsWYq3Guzy00YESW6YEIThdsLfkRHJh1NQVAUWVbr95QpAqYE2fY
 4V1w==
X-Gm-Message-State: AGi0PubFOKB5Y61U3SSPUNl3bY0ciYB/8hGAdov1FSF3Za0JnDd3Y0P3
 pqNCeLX9ryo2o8rcei5V+oCPj7vw9cMSiPFXMdsB45iKjUyIV80sJ5U5bFHVJ0DgiINuZKWiqQj
 pg5befUPY5H2zMOM=
X-Received: by 2002:a05:600c:a:: with SMTP id
 g10mr23000135wmc.153.1586852189240; 
 Tue, 14 Apr 2020 01:16:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJkA9WYn3NQ6rrrADSq/FoeOybl831mpEY2MQdfdVXyAS5/U2jZKok2RJGio0nxQk4v35J35Q==
X-Received: by 2002:a05:600c:a:: with SMTP id
 g10mr23000096wmc.153.1586852188905; 
 Tue, 14 Apr 2020 01:16:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e159:eda1:c472:fcfa?
 ([2001:b07:6468:f312:e159:eda1:c472:fcfa])
 by smtp.gmail.com with ESMTPSA id h2sm18175240wmf.34.2020.04.14.01.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 01:16:28 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] lockable: replaced locks with lock guard macros
 where appropriate
To: Markus Armbruster <armbru@redhat.com>
References: <20200404042108.389635-1-dnbrdsky@gmail.com>
 <20200404042108.389635-3-dnbrdsky@gmail.com>
 <CA+ZmoZVJhyuXbbUJHTQdFZKA6+WqYUgnxEXF0y-nq0=aK4cpww@mail.gmail.com>
 <aacbf5fb-2c13-b7a8-3a28-de0a9b1b465e@redhat.com>
 <87y2qyxzmf.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7623740b-e5e8-d966-c991-346c1c4ccee5@redhat.com>
Date: Tue, 14 Apr 2020 10:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87y2qyxzmf.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:iSCSI" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Daniel Brodsky <dnbrdsky@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/04/20 10:03, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 11/04/20 13:19, Daniel Brodsky wrote:
>>> Just making sure this patch didn't get lost.
>>> ping http://patchwork.ozlabs.org/patch/1266336/
>>
>> The patch looks good, but it will be included in QEMU only after 5.0 is
>> released.
> 
> Can we queue it for 5.1 right away?
> 

I don't have a 5.1 queue right now, but I should have one soon.  It's on
my todo list.

Paolo


