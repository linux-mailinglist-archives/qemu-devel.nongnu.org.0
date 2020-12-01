Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1262CA719
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:33:17 +0100 (CET)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7eX-0007Xh-0G
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk7bq-0005Fx-AI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk7bo-0006uj-GK
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606836627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=923cnG7GWpcz3m6QxylIKA6GyyAvrYTNWiNrHrhHqaQ=;
 b=Lb2VBTg0TUINBZZP3PCKZn4PqF/YAI3KfTs0/a8N9gqSRZ/l6vftn1ZamMM0uLDE/is5HI
 8PSGkjP5f4rBqQMB/qNgzkPs12VlG7guul8Wfq+DeIaQG4J+Ba6gd8UUlCYjeZuwFprusD
 bZrqLByiTaRZNVSIOB4UZskeZc+weEA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-0WtxoNDDOriHbFXCwMfTuQ-1; Tue, 01 Dec 2020 10:30:25 -0500
X-MC-Unique: 0WtxoNDDOriHbFXCwMfTuQ-1
Received: by mail-ed1-f71.google.com with SMTP id c24so1518719edx.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=923cnG7GWpcz3m6QxylIKA6GyyAvrYTNWiNrHrhHqaQ=;
 b=Mkh5ekpcWrpCaS3nEc99Ci3eA/zbRHsVoD2M5SXzRYZT8afMelxBz5xh7n2NgUyQB6
 Ddi7PFmXl16cAK96Q4eJf0cfrTIwn0gpG2tLHS5LsZx2tdNlvGM88V0AZtYRUyXw0OtT
 VPSKQQalnARoRnVyJoV/NR3V+brw2o2AAxLy3E+D22wyrePYuUuqdEBsbnSeaBkW8KCj
 rl21+vr7NR3N7JDEjPDtKSf+MOnwCKoLKcsaSJyEiwnSOBi3dU/YLjTIyXQZn2SVm0Du
 jLa83cwykPp8Jwh90jVlEtqiogE/tHtu+IdrPfg7pwpRHaGKwQ6GajDsMxFQ7cthhxOa
 M3SA==
X-Gm-Message-State: AOAM533gqgjA02BZQyH7tzIS15eb1IdkaDAAv+4gjPwZQ05zNE/Tbmmh
 95k1fksPP2pVMhmhMlFt3Spsr9dx2zyAiU4USu0UZDMmXS2i6F3DPMggTP1ZnNN8IsvoFy7zTjP
 1BSTaefVX75DzlfYYqX2sxlhwhfCH0YqxIQotSo9u2zuh7X2KPrtXkWszTRXdM5d2JEE=
X-Received: by 2002:a17:906:3704:: with SMTP id
 d4mr3563315ejc.338.1606836623726; 
 Tue, 01 Dec 2020 07:30:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+Ld22gWF2+zGT92yyiBMnYe2xmeqtni7uS2v5V2/8Fw/JrUs230ZcH0bq2Zpwn0i9CvNa8A==
X-Received: by 2002:a17:906:3704:: with SMTP id
 d4mr3563272ejc.338.1606836623441; 
 Tue, 01 Dec 2020 07:30:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k16sm39776ejv.93.2020.12.01.07.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:30:22 -0800 (PST)
To: P J P <ppandit@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
Message-ID: <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
Date: Tue, 1 Dec 2020 16:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 16:00, P J P wrote:
> * I was thinking about checking 'elementary_transfer_size' against
>    'byte_count_limit', but that did not work out. The loop is confusing there,
>    it first sets elementary_size = size and subtracts the same

Yes, that part is correct.

> * 's->lba == -1' did not strike me as wrong, because code explicitly checks it
>    and gets past it. It does not flag an error when 's->lba == -1'.

The command spec only matters to some extent (it matters more in writing 
a fix than in understanding the bug).

The questions to ask yourself after reading the code are:

1) ide_atapi_cmd_reply_end does contain an attempt at resetting an 
out-of-bounds io_buffer_index to 0.  Why is the reproducer bypassing it? 
  The answer must be because s->lba == -1.

2) what it means for ide_atapi_cmd_reply_end treats s->lba == -1 
differently.  The answer is that s->lba == -1 means the command is not a 
read (according to the code) but in this case you get there with a read.

> * I tested the patch with a reproducer and it helped to fix the crash.

Yes, but fixing the crash is not enough.  You need to ensure that the 
code makes sense.  You need to distinguish between violated 
preconditions and the consequences of those violations.  Once a 
precondition is violated, all bets are off on what happens in the code 
below it.  So if you don't catch the violated precondition at the 
_first_ place where it can happen, you can have other issues elsewhere.

So again the question to ask is, how do you get s->lba == -1 in read 
context?  Where did things go wrong?  Are there other read paths that 
can set s->lba == -1?  This is where reading the spec (as opposed to the 
code) starts to be important.

> * My doubt about the patch was that it prematurely ends the while loop ie.
>    before s->packet_transfer_size reaches zero(0), there may be possible data
>    loss.

Right, catching the problem above means that you can just raise an ATAPI 
command error.

> | 3) We also need to ensure that the bug will not happen again.  Did you get a
> | reproducer from the reporter?  If not, how did you trust the report to be
> | correct?  If so, did you try to include it in the QEMU qtest testsuite?
> 
> * I did test it against a reproducer, but did not get to the qtest part for
>    the time constraints.

qtests are not just helpful.  Adding regression tests for bugs is a 
*basic* software engineering principle.  If you don't have time to write 
tests, you (or your organization) should find it.

But even if you don't write tests you need at least to enclose the 
reproducer, otherwise you're posting a puzzle not a patch. :)

Paolo


