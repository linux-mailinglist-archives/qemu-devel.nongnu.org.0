Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86093ECA27
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 18:14:56 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFIml-0007DM-AR
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 12:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFIlz-0006Z5-Gt
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 12:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFIlv-0002Lq-Dy
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 12:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629044041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+FGd0vGN7TWwNSzE419JSa4JsbEGoJgnnZAkE3WF+E=;
 b=ZPnC2Q73vyzJZ2BbO1ZMwhu4TJQBx+T980wBovVYtu0XVjh7C2D0Hj7TJogjqrrIINevvA
 i1WoTQJ/FjA3/94L4+eEXkTFEwdfdMXQK+JVX8DweYmi1Sh9voeO6Q5+Rpfbty5d0r12at
 uBJ05PSwEIpkgMKgK65GoGz08D7cJSA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-2_Uylaj4NcmWc_vTO_xooQ-1; Sun, 15 Aug 2021 12:13:59 -0400
X-MC-Unique: 2_Uylaj4NcmWc_vTO_xooQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so2637819wrr.2
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 09:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s+FGd0vGN7TWwNSzE419JSa4JsbEGoJgnnZAkE3WF+E=;
 b=NJvgN5AczEZN8KX6GdrruV7PcVrkcCRGFmmdfL0ZLvYUozyEShKUGn00h1YJ99BDif
 /Wehy0nHmStk64+c3AI8jcL2LqQKOgWNNuwxIofUJpOozjH1+vPqYlaBw/rMeA10Ma43
 KxTk/PMG27PhvNuZisv9sHsMtsLKxu5mAbfRRQChWaUOcNaYT2T4iS5MyCgEVLNN6P9x
 ng268uJhsIVV0UQy+QmI3sVZxcmU7u0SKijP2DExkFwkzZS9TNe4733qPr5iRpWjHjjK
 mE35l18zItFQsE9IvOGKOBquOGknNKhcdtRmmoH3efa0wvNF6VxB4L5M+7smu8FMcaLa
 cItA==
X-Gm-Message-State: AOAM533sQ6zUBdfw6FsfKdyM6645Oxj2Rf9Ix1l+dPmIkzStxHhbR/RX
 f/V+o+Tpezr41gyDFsbh4MqemZh8lxbjWRa+Jn5djnRqUgbVr7saA32XL4zZ6+Qyj+ggoUjXd09
 onR2SO4/LmqXPIow=
X-Received: by 2002:a5d:638b:: with SMTP id p11mr13933438wru.257.1629044038431; 
 Sun, 15 Aug 2021 09:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf1RRtjBk8EPF2D5yX+5dIrgK3SnsHL1avfduRu87zJSwm3KawvI99SxZhoQ53Gb2Bobzr+Q==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr13933423wru.257.1629044038227; 
 Sun, 15 Aug 2021 09:13:58 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y3sm8526048wma.32.2021.08.15.09.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 09:13:57 -0700 (PDT)
Subject: Re: [PATCH for-6.2 0/4] Zero sockaddr_in when initializing it
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
 <20210813183015.qlfqrshmplxseued@redhat.com>
 <613eaeab-337f-a5aa-91cb-029d38d694f3@redhat.com>
 <CAFEAcA-NP6ksSbd4sjREJh9sd0z-uP5rUJOcVNOYL=+VwE49cw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a751d952-8f9f-a861-2dad-0d5482a59c12@redhat.com>
Date: Sun, 15 Aug 2021 18:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NP6ksSbd4sjREJh9sd0z-uP5rUJOcVNOYL=+VwE49cw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/15/21 5:44 PM, Peter Maydell wrote:
> On Sun, 15 Aug 2021 at 15:34, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 8/13/21 8:30 PM, Eric Blake wrote:
>>> FWIW, the POSIX wording is interesting - it requires portable
>>> applications to zero out sockaddr_in6 (and even states that memset()
>>> is not yet a portable way to do that on exotic hardware, although a
>>> future version of POSIX may add a zero-bit constraint on
>>> implementations; in practice we only use qemu on hardware where
>>> memset() to zero properly sets pointers to NULL and floating points to
>>> 0.0).
>>
>> So this checkpatch.pl error (inherited from Linux) is against POSIX?
>>
>> 2028 # check for static initialisers.
>> 2029         if ($line =~ /\bstatic\s.*=\s*(0|NULL|false)\s*;/) {
>> 2030             ERROR("do not initialise statics to 0 or NULL\n" .
>> 2031                 $herecurr);
>> 2032         }
> 
> That one is for statics, where the C spec says you get 0-init by
> default and so there's no need to explicitly 0-init.

Ah OK, thanks :)


