Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2E591BC3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:55:27 +0200 (CEST)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtTy-0007Kv-Bc
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oMtBr-00033U-0F
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 11:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oMtBm-0006ey-7r
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 11:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660404995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMoi3jhoO/822L2kgDvPiiLZd408YOvLxeeDK4N3QIg=;
 b=jWVYWZNlo45aTgX95UlarEREDGrDsz68M8wqqMVmAzOViWNnHS8EaoQ+kBgYq4YR8TGvu6
 LhFvA7/oXMh2hwYhiQy2HtYgwKFJgfGHrT5UyMMQm1yuZV4KxKIWndN7JYLfvAN/WItpGi
 WktFsi/xuNh1+oPpJegBxUJSni7fr2E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-aNURfKxhM9STrvze6lHBUw-1; Sat, 13 Aug 2022 11:36:26 -0400
X-MC-Unique: aNURfKxhM9STrvze6lHBUw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v24-20020a7bcb58000000b003a37681b861so806924wmj.9
 for <qemu-devel@nongnu.org>; Sat, 13 Aug 2022 08:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=GMoi3jhoO/822L2kgDvPiiLZd408YOvLxeeDK4N3QIg=;
 b=ZXds/YFUJcMtbBVkUYFfNMxKY3QLrfSRvubk7L6KTW+HFniQnIfAGGW8MrG9UnIaFn
 PQbXMtBHBXrjWBP3UX4JOXsKZ05PA55i9UBTeMR5B/tl87sya9wssDRw10wKRLyA4h3K
 i5olvUbBcLythyauv6TvBu5qILYaMEqQH3YdWo8LszCW7IoyBvswD1Ww1F7awiWrq8q4
 NZpOjyjprw8AZcpKW0N4lP9t7FwQx+V8N9qXHz8t8uFMzGVQTPTdWorUX2qXomaa/vO1
 TTOTY/cKH+en18VclGI/hsPStpPeNO9xKVlQrKHPfog2ODsoYMe9I9RMRBKTBjrnbsz0
 /ywQ==
X-Gm-Message-State: ACgBeo12BkyIKg3hlKb1ALbb6cDeStCL4KKRpqaycQan/FGTTlbwrLQz
 ScoifHbk9E73kTMaSPGFtOm/LF9YCK445BxUdnfHGmOTQ2/d8lzJmQgq6ciigebgKg+S5AP2y/E
 lvH7LVWwYL5f0JNM=
X-Received: by 2002:a05:600c:1d8c:b0:3a5:a536:bf71 with SMTP id
 p12-20020a05600c1d8c00b003a5a536bf71mr12142771wms.201.1660404985401; 
 Sat, 13 Aug 2022 08:36:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ofcqzwlr5aGQGIu619jsrTKzVsIJDRkB8AtAEpAjOUQfsgtNj73h4h//c4wLd02j3GuK6Jw==
X-Received: by 2002:a05:600c:1d8c:b0:3a5:a536:bf71 with SMTP id
 p12-20020a05600c1d8c00b003a5a536bf71mr12142751wms.201.1660404985184; 
 Sat, 13 Aug 2022 08:36:25 -0700 (PDT)
Received: from localhost ([178.139.230.247]) by smtp.gmail.com with ESMTPSA id
 y2-20020a7bcd82000000b003a5c999cd1asm4205683wmj.14.2022.08.13.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 08:36:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v7 03/12] migration: Export ram_transferred_ram()
In-Reply-To: <fce3323a5d903bc62c64e8e60184b20a2bcafac5.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 05:11:08
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-4-quintela@redhat.com>
 <fce3323a5d903bc62c64e8e60184b20a2bcafac5.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Sat, 13 Aug 2022 17:36:23 +0200
Message-ID: <87zgg8duko.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Is this doubled Signed-off-by intentional?

It is .git/hooks/prepare-commit-msg for you.

Adding --if-exits doNothing

And we will see how it breaks in (other) very subtle ways.


>
> Other than that, FWIW:=20
> Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks, Juan.


