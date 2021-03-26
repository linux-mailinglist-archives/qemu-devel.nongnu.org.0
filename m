Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F434A32C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:31:35 +0100 (CET)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhsU-00076D-5X
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPhqo-0006TM-Vc
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPhqm-00020y-4G
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616747386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HFQZuT7wVaCe779NyVtrVkTOn1InrWUZ7GpLlVQURok=;
 b=JFynRuR0HNY5PtlHrJLwjE5ICrexI9SDvBbHzAQZhPNCVeq3efkO7B7jbFTk9wfVezzoII
 +stUvC9CME9/SpbM9hnSKe2mnI1rSrNKKMnG4ZKys2/rEoGGq5C/98nvOTZaj9TENsa7h6
 UlBkzM0/dv9lvmFzb3P4yo4v3I2DUns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-vqs4m3d-PuqwgU-TiJ88mQ-1; Fri, 26 Mar 2021 04:29:43 -0400
X-MC-Unique: vqs4m3d-PuqwgU-TiJ88mQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD29918C8C02
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 08:29:42 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-10.pek2.redhat.com
 [10.72.13.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E645D88F0E;
 Fri, 26 Mar 2021 08:29:38 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] virtio:add support in configure interrupt
To: Cindy Lu <lulu@redhat.com>
References: <20210323015641.10820-1-lulu@redhat.com>
 <20210323015641.10820-2-lulu@redhat.com>
 <fe923c35-1172-6b55-e6a5-eddb5ffacdce@redhat.com>
 <CACLfguWy8ccnTnJJuwE0VUyZyXL5Rrg=LSEwUuHToHOEXOY-mg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <83dac3f6-ea2f-76e3-3d2e-394483c3bc5c@redhat.com>
Date: Fri, 26 Mar 2021 16:29:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACLfguWy8ccnTnJJuwE0VUyZyXL5Rrg=LSEwUuHToHOEXOY-mg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------30B76594B781886E6A6CCD66"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------30B76594B781886E6A6CCD66
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2021/3/25 下午3:15, Cindy Lu 写道:
>>> +enum virtio_config_status {
>>> +    VIRTIO_CONFIG_SUPPORT,
>>> +    VIRTIO_CONFIG_WORK,
>>> +    VIRTIO_CONFIG_STOP,
>>> +    VIRTIO_CONFIG_STATUS_UNKNOWN,
>> Any reason for this extra state? I think we can know whether the config
>> interrupt is being used through a
>>
>> Thanks
>>
> The problem is I need to split the backend devices into 3 types,
> 1） normal device
> 2）vdpa support config interrupt. and the configur interrupt is active now
> 3）vdpa not support config interrupt.
> So I  add this bit and this bit will init in vpda /vhost modules and
> qemu can check this bit to know the  which behariver we will do in
> virtio bus  and other modules,


I wonder whether it's a must. We can setup guest notifiers 
unconditionally, so if it's an vhost bakcend without config interrupt 
support, such notifiers won't be used.

Thanks


>   Maybe I need to change this bit's name
> to make it more clearly
>
> Thanks
> Cindy




--------------30B76594B781886E6A6CCD66
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2021/3/25 下午3:15, Cindy Lu 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACLfguWy8ccnTnJJuwE0VUyZyXL5Rrg=LSEwUuHToHOEXOY-mg@mail.gmail.com">
      <blockquote type="cite" style="color: #007cff;">
        <blockquote type="cite" style="color: #007cff;">
          <pre class="moz-quote-pre" wrap="">+enum virtio_config_status {
+    VIRTIO_CONFIG_SUPPORT,
+    VIRTIO_CONFIG_WORK,
+    VIRTIO_CONFIG_STOP,
+    VIRTIO_CONFIG_STATUS_UNKNOWN,
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Any reason for this extra state? I think we can know whether the config
interrupt is being used through a

Thanks

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The problem is I need to split the backend devices into 3 types,
1） normal device
2）vdpa support config interrupt. and the configur interrupt is active now
3）vdpa not support config interrupt.
So I  add this bit and this bit will init in vpda /vhost modules and
qemu can check this bit to know the  which behariver we will do in
virtio bus  and other modules,</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I wonder whether it's a must. We can setup guest notifiers
      unconditionally, so if it's an vhost bakcend without config
      interrupt support, such notifiers won't be used.</p>
    <p>Thanks<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CACLfguWy8ccnTnJJuwE0VUyZyXL5Rrg=LSEwUuHToHOEXOY-mg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> Maybe I need to change this bit's name
to make it more clearly

Thanks
Cindy
</pre>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------30B76594B781886E6A6CCD66--


