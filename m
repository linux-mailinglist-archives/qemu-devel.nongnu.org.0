Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD022CA961
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:17:55 +0100 (CET)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9Hm-0003R5-Ci
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk9GO-0002sK-KA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk9GL-0001su-MD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606842985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAVp2rjo62iTklfycXyj1RAY+Lxt93cGp5uyRtjg4/w=;
 b=WuD/zjh7bFkKsfqlXR/RJ5XAyulvnZAvHvty1cYiiIcnUF1ERlB4JxeOCC6/eUaIOlYv0O
 xLYLGaam4rdY7voW5O0N7hTnLgjXs0W8shJF95Gq2pwPf0FVDci3KZFYPqTSMB5VODC76d
 mx48cieqJZ+jpN8CTZ5Zaeh7AC/JxI0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-JFBDPLVQMPCU1Uo-NeHiCQ-1; Tue, 01 Dec 2020 12:16:23 -0500
X-MC-Unique: JFBDPLVQMPCU1Uo-NeHiCQ-1
Received: by mail-ej1-f72.google.com with SMTP id dv25so486784ejb.15
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FAVp2rjo62iTklfycXyj1RAY+Lxt93cGp5uyRtjg4/w=;
 b=g3AIuY/UXOs3vAd+Hi0FPa7PwUP8pGMEq51YQn4hE/pdWO/MJRLP3ArIQ/gmkRx6oU
 bmU4bqYEGxryW23mc/8TkwgbscmiIzrIH6JQbYSg1XRu+koAfPc/AJDEUInhDxzZU/BF
 GzHQEU6EF9gk4GLMxP44DB79T0bzi6aQyl9xRDWSt+4oLb9lGzJj/J9uwhMk360pTBYL
 W8cqxsOBHLwodXPELPk/GiXrJ4b+SYnmZB/iOmgrJjgaHAdXtKftQ2XLVjhUN6+GIpJV
 Ov35/47B03lp/JePU26Ukd+hbSNHrrk9yc6S5Fwe3n6ACQsf8R7Hk7w2R5XdAFBydjda
 7beg==
X-Gm-Message-State: AOAM5327lkK/QwBuMp1/iKLouPw91nKmD+IhbCqDazGG25tGPIHKVBr6
 7c+x1SoZn7DSza9L8efh2frSQ6fzuQgAnKEEbJST5ihaa9eZB61qiCPIq1xAX4a5XbS6wVtHMJr
 vp7NgmdDwbbJOJeQ=
X-Received: by 2002:a17:906:7104:: with SMTP id
 x4mr3990392ejj.141.1606842977304; 
 Tue, 01 Dec 2020 09:16:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxEO00uIm++FhuFt41jqO5HKcZ7+i02g8ddy2+59T5KVsUztoXogaMUCsLqVLeyiHbBfptrA==
X-Received: by 2002:a17:906:7104:: with SMTP id
 x4mr3990346ejj.141.1606842976895; 
 Tue, 01 Dec 2020 09:16:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h23sm184103ejg.37.2020.12.01.09.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:16:15 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
Date: Tue, 1 Dec 2020 18:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201162042.GB6264@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 17:20, Kevin Wolf wrote:
> Am 30.11.2020 um 20:35 hat Paolo Bonzini geschrieben:
>> For devices it's just the practical issue that there are too many to have
>> something like this series.  For machine types the main issue is that the
>> version-specific machine types would have to be defined in one more place.
>
> Sure, the number of devices means that we can't convert all of them at
> once. And we don't need to, we can make the change incrementally.

There's also the question that most devices are not present in all 
binaries.  So QAPI introspection would tell you what properties are 
supported but not what devices are.  Also the marshaling/unmarshaling 
code for hundreds of devices would bloat the QEMU executables 
unnecessarily (it'd all be reachable from visit_DeviceOptions so it'd 
not be possible to compile it out, even with LTO).

Plus the above issue with machine types.

>>>> The single struct doesn't bother me _too much_ actually.  What bothers me is
>>>> that it won't be a single source of all QOM objects, only those that happen
>>>> to be created by object-add.
>>>
>>> But isn't it only natural that a list of these objects will exist in
>>> some way, implicitly or explicitly? object-add must somehow decide which
>>> object types it allows the user to create.
>>
>> There's already one, it's objects that implement user creatable.  I don't
>> think having it as a QAPI enum (or discriminator) is worthwhile, and it's
>> one more thing that can go out of sync between the QAPI schema and the C
>> code.
> 
> Well, we all know that this series duplicates things. But at the same
> time, we also know that this isn't going to be the final state.
> 
> Once QAPI learns about QOM inheritance (which it has to if it should
> generate the boilerplate), it will know which objects are user creatable
> without a an explicitly defined separate enum.
> 
> I think it will still need to have the enum internally, but as long as
> it's automatically generated, that shouldn't be a big deal.

Right, I don't want to have the final state now but I'd like to have a 
rough idea of the plan:

1) whether to generate _all_ boilerplate or only properties

2) whether we want to introduce a separation between configuration 
schema and run-time state

3) in the latter case, whether properties will survive at all---iothread 
and throttle-groups don't really need them even if they're writable 
after creation.

These questions have a substantial effect on how to handle this series. 
  Without answers to this questions I cannot understand the long term 
and its interaction with other long term plans for QOM.

>>> A modified QOM might be the right solution, though. I would like to
>>> bring QAPI and QOM together because most of these weaknesses are
>>> strengths of QAPI.
>>
>> I agree wholeheartedly.  But your series goes to the opposite excess.
>> Eduardo is doing work in QOM to mitigate the issues you point out, and you
>> have to meet in the middle with him.  Starting with the user-visible parts
>> focuses on the irrelevant parts.
> 
> QAPI is first and foremost about user-visible parts, and in fact most of
> the problems I listed are about external interfaces.

Yes, but QAPI is also about interfacing with existing code.  Also, QAPI 
does not generate only structs, it also generate C function prototypes. 
I'm not sure whether a QOM object's more similar to the struct case 
(what you do here) or to the QMP command case:

- there's a 1:1 correspondence between ObjectOptions cases and 
ucc->complete implementations

- there's a registry of object types just like there's one for QMP commands.

So another possibility could be that the QAPI generator essentially 
generated the user_creatable_add_type function that called out to 
user-provided functions qom_scsi_pr_helper_complete, 
qom_throttle_group_complete, etc.  The arguments to those functions 
would be the configuration.  That is a very interesting prospect (though 
one that would require changes to the QAPI code generator).

> BlockdevOptions is about external interfaces, not about
> implementation details. Same thing as QOM properties are external
> interfaces, not implementation details. There may be fields in the
> internal state that correspond 1:1 to the externally visible QAPI
> type/QOM property, but it's not necessarily the case.

Right.  It may well be that we decide that, as a result of this series, 
QOM's property interface is declared essentially a failed experiment.  I 
wouldn't be surprised, and that's why I want to understand better where 
we want to go.

For example, Eduardo is focusing specifically on external interfaces 
that correspond 1:1 to the internal implementation.  If we decide that 
non-1:1-mappings and checks on mandatory properties are an important 
part of QOM, that may make large parts of his work moot.  If we decide 
that most QOM objects need no properties at all, then we don't want to 
move more qdev-specific stuff from to QOM.

> QAPI is already here and it's going to stay. QOM doesn't have to
> duplicate input validation that existing code can already perform.
> 
> I'm not sure which complexity you think I'm introducing: QAPI is already
> there. I'm adding the schema, which you agree is valuable documentation,
> so we want to have it either case. The actual change to QOM that we have
> in this series is this:

The complexity is that properties used to be split in two places, and 
now they're split in three places.

It may very well be that this is a good first step to at least have 
classes described in the QAPI schema.  But since _in the short term_ 
there are things that the series makes worse (and has a risk of bringing 
things out of sync), I'd like to understand the long term plan and 
ensure that the QAPI maintainers are on board with it.

Can you at least add a comment to all UserCreatable classes that says 
"if you add a property, remember to modify ... as well in the QAPI schema"?

>> Are there any validation bugs that you're fixing?  Is that
>> something that cannot be fixed elsewhere, or are you papering over bad QOM
>> coding?  (Again, I'm not debating that QOM properties are hard to write
>> correctly).
> 
> Yes, I found bugs that the QAPI schema would have prevented. They were
> generally about not checking whether mandatory propertes are actually
> set.

Okay, I found your series at 
https://patchew.org/QEMU/20201130105615.21799-1-kwolf@redhat.com/ too, 
good to know.

So that's another useful thing that can be chalked to this series at 
least if -object and object_add are converted (and also, another thing 
against QOM properties and 1:1 mappings between configuration schema and 
run-time state).

Paolo


