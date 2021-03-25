Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F93486FA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:37:31 +0100 (CET)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFsI-0007Hd-4T
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPFrW-0006rW-7P
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPFrR-000344-Ue
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616639796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXXG5sIWNcUTcVffJukiUIgv4NjcvLPhTp+Hbsbj2+M=;
 b=Z5qH15i9eTbMeD/ymO8CValfZYmep+Q7+Y19i9OibF0Rx+jBkvlbCqgnsQYbjGL/Ex8TjC
 ZZ0uTwRCmmMF8e29L8Iww/uSpV8YBv9ll8R9PELnDaI03pRsCXxjWozRZkIrz3LzWOLEVd
 2eN8elZxOr4vusADLHYQIZuaf8QvGsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-ieDH8Wn0Pm-896o_JCr2zg-1; Wed, 24 Mar 2021 22:36:34 -0400
X-MC-Unique: ieDH8Wn0Pm-896o_JCr2zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8FBB84B9A4;
 Thu, 25 Mar 2021 02:36:33 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-186.pek2.redhat.com
 [10.72.13.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 948307092E;
 Thu, 25 Mar 2021 02:36:31 +0000 (UTC)
Subject: Re: [PULL V2 16/20] qapi: net: Add query-netdev command
From: Jason Wang <jasowang@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
 <1615799673-31549-17-git-send-email-jasowang@redhat.com>
 <CAFEAcA-7MiRBVvGhaA7XbzMoCHBBie6-w7miyg-kAzZ0F=-XPg@mail.gmail.com>
 <cfd051e2-0bee-2d7d-16cd-0c70c8924ccf@redhat.com>
Message-ID: <8a4189e5-7bfc-4205-b421-d18f0882fe22@redhat.com>
Date: Thu, 25 Mar 2021 10:36:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cfd051e2-0bee-2d7d-16cd-0c70c8924ccf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/17 上午11:34, Jason Wang 写道:
>
> 在 2021/3/17 上午5:37, Peter Maydell 写道:
>> On Mon, 15 Mar 2021 at 09:15, Jason Wang <jasowang@redhat.com> wrote:
>>> From: Alexey Kirillov <lekiravi@yandex-team.ru>
>>>
>>> The query-netdev command is used to get the configuration of the 
>>> current
>>> network device backends (netdevs).
>>> This is the QMP analog of the HMP command "info network" but only for
>>> netdevs (i.e. excluding NIC and hubports).
>>>
>>> The query-netdev command returns an array of objects of the NetdevInfo
>>> type, which are an extension of Netdev type. It means that response can
>>> be used for netdev-add after small modification. This can be useful for
>>> recreate the same netdev configuration.
>>>
>>> Information about the network device is filled in when it is created or
>>> modified and is available through the NetClientState->stored_config.
>>>
>>> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
>>> Acked-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>> Hi; Coverity complains about a memory leak in this code
>> (CID 1450842):
>>
>>> @@ -581,15 +693,25 @@ static int net_slirp_init(NetClientState 
>>> *peer, const char *model,
>>>       s->poll_notifier.notify = net_slirp_poll_notify;
>>>       main_loop_poll_add_notifier(&s->poll_notifier);
>>>
>>> +    stored_hostfwd = &stored->hostfwd;
>>> +    stored_guestfwd = &stored->guestfwd;
>>> +
>>>       for (config = slirp_configs; config; config = config->next) {
>>> +        String *element = g_new0(String, 1);
>> Here we allocate memory...
>>
>>> +
>>> +        element->str = g_strdup(config->str);
>>>           if (config->flags & SLIRP_CFG_HOSTFWD) {
>>>               if (slirp_hostfwd(s, config->str, errp) < 0) {
>>>                   goto error;
>> ...but if we take this error-exit path we have neither freed nor
>> kept a pointer to that memory.
>
>
> Yes.
>
>
>>
>>>               }
>>> +            stored->has_hostfwd = true;
>>> +            QAPI_LIST_APPEND(stored_hostfwd, element);
>>>           } else {
>>>               if (slirp_guestfwd(s, config->str, errp) < 0) {
>>>                   goto error;
>> Similarly here.
>>
>>>               }
>>> +            stored->has_guestfwd = true;
>>> +            QAPI_LIST_APPEND(stored_guestfwd, element);
>>>           }
>>>       }
>>>   #ifndef _WIN32
>> More generally, what state is the net backend init function
>> supposed to leave 'stored' in if it fails? Is it the backend's
>> responsibility to free everything that it might have allocated
>> and left a pointer to? eg if we did
>>     stored->hostname = g_strdup(vhostname);
>> do we need to go back and free(stored->hostname) ? Or is the caller
>> guaranteeing to clean up 'stored' somehow ? Or is the backend
>> supposed to not touch 'stored' until it's sure it's going to
>> succeed ? (presumably not, as the current code does not do this...)
>
>
> Clean and free in the function that do the allocation seems better 
> (self-conatined).
>
>
>>
>> This commit has no comments describing or documenting the
>> API requirements the new functionality imposes on a net backend:
>> could we have a followup patch which adds some documentation,
>> please, so that authors of future backends know what they have to
>> implement ?
>
>
> Alexey, plase send patches to fix the above issues and document the API.
>
> Thanks


Alexey, any update on this. If it takes time I tend to revert this and 
let's re-try for 6.1?

Thanks


>
>
>>
>> thanks
>> -- PMM
>>
>
>


