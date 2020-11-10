Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540122AD179
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:40:47 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPCo-00074t-8s
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcPBY-0006au-SG
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcPBW-0001KD-D9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604997561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WanF2LzMDMbRt9s6+IvMPUiaaLYESx7IgC4B21Ch43Y=;
 b=hvCy1YXB1LDHadeLLA5l/KRQZajfd09yovpua4cdIwaopZnEzpXRyQPYbrmld6JhdgR8vO
 UDmhnGySCmhUYGs7L6Rm5WBsrQbec+BSkiYOklFUob94nBNGvkKztYAyijqcQmDx5qwDeD
 AhqGUsad/B/XgG3ouAA6R+jTFWpd1aQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-xf6RpeksPEm1TvSRWaX6Uw-1; Tue, 10 Nov 2020 03:39:17 -0500
X-MC-Unique: xf6RpeksPEm1TvSRWaX6Uw-1
Received: by mail-ed1-f72.google.com with SMTP id bc27so3886541edb.18
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 00:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WanF2LzMDMbRt9s6+IvMPUiaaLYESx7IgC4B21Ch43Y=;
 b=FrOfKIVuL4NQCDFMixpVafFt5VhO0+fALJ1RqoZcshEndJW/UvvCBk96L7AQbraXcq
 Xl7+WPpQOOoXUrlUWia955FCup3DdgojkvWJuIGNBu4MpF/fdFEIXg5aLkPHoZoQgPPL
 5sgJDxnl1M8BPFIWW6Rj2/wxN8swzvgq9sBNQL/hCM7Cxi+mR8UzROeSSUtkhfxmL3wj
 hHIWKCHUV193az8p1z2VUtLf18Br/nU+P7T2HUHSvoAEOKluzNN5yfrFiHp6w4tMDXfi
 dzZx3myPNC9MXK4kdh+G8iDz8qWoMNeZlT7GNYtXOGVtxibVbCO75TVwYW5TlaOX0rjT
 Y8uQ==
X-Gm-Message-State: AOAM5319UsuQI+sYAv4IRtbVd09gGYReEGxkeB6Hl6VQ79I3aHybj9Uj
 MPo4h1QFnteMKoQQHKfgeHuxWAbkaYVvbkiKQjwfS4z79lgVpMOPPW4FfACmIwMa45fPU6zk3YU
 aq/SBdJy3uIswTGfYplH2XZqqTNV3xMuVq6tOaUVw9NQRuLGXC02cpo5c+/8kwF6+tUA=
X-Received: by 2002:a05:6402:1542:: with SMTP id
 p2mr19594930edx.298.1604997555664; 
 Tue, 10 Nov 2020 00:39:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKXlx5o8OGulo/YX1R3BugFKLKYTGNxvHDFO11I0xHl+fAMmldmnl7HFOhX8hUw+3PvT1hLg==
X-Received: by 2002:a05:6402:1542:: with SMTP id
 p2mr19594920edx.298.1604997555408; 
 Tue, 10 Nov 2020 00:39:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rn28sm10113711ejb.22.2020.11.10.00.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 00:39:14 -0800 (PST)
Subject: Re: [PATCH v2 4/6] qemu-option: clean up id vs. list->merge_lists
To: Markus Armbruster <armbru@redhat.com>
References: <20201109133931.979563-1-pbonzini@redhat.com>
 <20201109133931.979563-5-pbonzini@redhat.com>
 <87wnyu4gf9.fsf@dusky.pond.sub.org>
 <736a0053-83b9-3510-82ad-99ea59ea00fe@redhat.com>
 <87a6vq4bqj.fsf@dusky.pond.sub.org>
 <e6fbdb7a-c352-bb81-1dad-7f19c704b108@redhat.com>
 <87o8k5zkbc.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e69d4246-8075-8a4e-2709-c3473fe68040@redhat.com>
Date: Tue, 10 Nov 2020 09:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87o8k5zkbc.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 09:29, Markus Armbruster wrote:
> As we will see below, there are exceptions where we reject
> options that used to work.  Do we want that?

I think that, as long as we gain in consistency, we do.  The special 
casing of "id" is a wart of the current parser and the less it shows 
that "id" is treated specially, the best.

Deprecating or downright rejecting working combinations is always 
walking a fine line, but here we're almost in https://xkcd.com/1172/ 
territory.

Paolo


