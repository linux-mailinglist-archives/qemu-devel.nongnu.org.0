Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB624871D9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:41:39 +0100 (CET)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5h4M-0006IZ-8P
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5h1S-000527-Oo
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5h1N-0007iS-UC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641530311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRWFYHi62t8+G6mOBe/2y2W4g3cRbbUTZF+BPSKZU/A=;
 b=euXnw9DeftRW7nZss/2RhE89PWWLDVO4bFg1tF9k8MGwlDdmA02TIiiLtS0D4zo1x/Obew
 jndmCRUhkpwIh5sx2SXDkcUHA7VtHgbY0LW11hSpFoqYcXs0meGvh2hYOpS8TyFM1vwiK+
 NXSVK5xTjzYbE++Z7PrpbfZLcr85yKQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-DXf2dyTjNBqJqH1QpEVyUw-1; Thu, 06 Jan 2022 23:38:30 -0500
X-MC-Unique: DXf2dyTjNBqJqH1QpEVyUw-1
Received: by mail-lf1-f70.google.com with SMTP id
 g18-20020a05651222d200b0042612bda352so1484113lfu.11
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRWFYHi62t8+G6mOBe/2y2W4g3cRbbUTZF+BPSKZU/A=;
 b=WYwjqw2OR3zvcRHtU48EHB9pAnizmD+oPQ2S+bGbWzHa6HrhHWxYKkZcgGkXkNQNiC
 l/BZ6FkoK09bLEcY2PDc0aDVGWK0MktM6g5u3J6HTAeVdmTfPqs/9komBnmb/kr+Nft9
 cJAs4YuHq/JrGscOzMN31c0AvvBIjLbZZQ0fkwOSKdSxgyjXV/ljQfHYm3zMqZXGH8Rp
 9tylZJ8o8UB2dYJIOXa47TtDjkAZL/YMyAVjqIyHKnHJzhOS8ZyILTRr17D56irWVV7v
 DbhTiLC+E5k7Dd5ClvQ7Bk3CmdVFJToKgXSym05ipDLU7BudI8fKhTZkzLhuNTck9gDx
 N91A==
X-Gm-Message-State: AOAM533BpsL3RnG4LP+6rfr8EHRJwuLG4ufjXfhBm0rP4jc4xXV4lZZQ
 hzUqyd/Xf2xcjlAMzvxkGro6IJLawd7tSv0bipIKw26uV2IkeAaXAQq+ehg/OQnc8970ZdmE+RX
 iDZ/+8dfSJFIhFZGlclVXqbT/H17zwdw=
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr54059711lfm.580.1641530308540; 
 Thu, 06 Jan 2022 20:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBAuryCuJBVOy/l6FFLRgRMQA1YJp2ByFFdRjvj+AmUJ8FwSVUHYgKC1NkFmPC9aBEJCIijsWwVh0a9YTv9Gw=
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr54059697lfm.580.1641530308309; 
 Thu, 06 Jan 2022 20:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20211227012028.545526-1-lei.rao@intel.com>
 <MWHPR11MB00316E1420745466BD09EB809B429@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00316E1420745466BD09EB809B429@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 7 Jan 2022 12:38:17 +0800
Message-ID: <CACGkMEv7YMzGcXjDsdySZs4vmF0hhO7uL7xV924zoUqpCLCZ=A@mail.gmail.com>
Subject: Re: [PATCH v2] net/filter: Optimize filter_send to coroutine
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 27, 2021 at 10:14 AM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Rao, Lei <lei.rao@intel.com>
> > Sent: Monday, December 27, 2021 9:20 AM
> > To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> > jasowang@redhat.com
> > Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>; Li Zhijian
> > <lizhijian@fujitsu.com>
> > Subject: [PATCH v2] net/filter: Optimize filter_send to coroutine
> >
> > This patch is to improve the logic of QEMU main thread sleep code in
> > qemu_chr_write_buffer() where it can be blocked and can't run other
> > coroutines during COLO IO stress test.
> >
> > Our approach is to put filter_send() in a coroutine. In this way,
> > filter_send() will call qemu_coroutine_yield() in qemu_co_sleep_ns(), so
> > that it can be scheduled out and QEMU main thread has opportunity to run
> > other tasks.
> >
> > Signed-off-by: Lei Rao <lei.rao@intel.com>
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
>
> Looks good to me.
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Applied.

Thanks

>
> Thanks
> Chen
>
> > ---
> >  net/filter-mirror.c | 66 ++++++++++++++++++++++++++++++++++++--------
> > -
> >  1 file changed, 53 insertions(+), 13 deletions(-)
> >
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > f20240cc9f..34a63b5dbb 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -20,6 +20,7 @@
> >  #include "chardev/char-fe.h"
> >  #include "qemu/iov.h"
> >  #include "qemu/sockets.h"
> > +#include "block/aio-wait.h"
> >
> >  #define TYPE_FILTER_MIRROR "filter-mirror"
> >  typedef struct MirrorState MirrorState; @@ -42,20 +43,21 @@ struct
> > MirrorState {
> >      bool vnet_hdr;
> >  };
> >
> > -static int filter_send(MirrorState *s,
> > -                       const struct iovec *iov,
> > -                       int iovcnt)
> > +typedef struct FilterSendCo {
> > +    MirrorState *s;
> > +    char *buf;
> > +    ssize_t size;
> > +    bool done;
> > +    int ret;
> > +} FilterSendCo;
> > +
> > +static int _filter_send(MirrorState *s,
> > +                       char *buf,
> > +                       ssize_t size)
> >  {
> >      NetFilterState *nf = NETFILTER(s);
> >      int ret = 0;
> > -    ssize_t size = 0;
> >      uint32_t len = 0;
> > -    char *buf;
> > -
> > -    size = iov_size(iov, iovcnt);
> > -    if (!size) {
> > -        return 0;
> > -    }
> >
> >      len = htonl(size);
> >      ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
> > @@ -80,10 +82,7 @@ static int filter_send(MirrorState *s,
> >          }
> >      }
> >
> > -    buf = g_malloc(size);
> > -    iov_to_buf(iov, iovcnt, 0, buf, size);
> >      ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)buf, size);
> > -    g_free(buf);
> >      if (ret != size) {
> >          goto err;
> >      }
> > @@ -94,6 +93,47 @@ err:
> >      return ret < 0 ? ret : -EIO;
> >  }
> >
> > +static void coroutine_fn filter_send_co(void *opaque) {
> > +    FilterSendCo *data = opaque;
> > +
> > +    data->ret = _filter_send(data->s, data->buf, data->size);
> > +    data->done = true;
> > +    g_free(data->buf);
> > +    aio_wait_kick();
> > +}
> > +
> > +static int filter_send(MirrorState *s,
> > +                       const struct iovec *iov,
> > +                       int iovcnt)
> > +{
> > +    ssize_t size = iov_size(iov, iovcnt);
> > +    char *buf = NULL;
> > +
> > +    if (!size) {
> > +        return 0;
> > +    }
> > +
> > +    buf = g_malloc(size);
> > +    iov_to_buf(iov, iovcnt, 0, buf, size);
> > +
> > +    FilterSendCo data = {
> > +        .s = s,
> > +        .size = size,
> > +        .buf = buf,
> > +        .ret = 0,
> > +    };
> > +
> > +    Coroutine *co = qemu_coroutine_create(filter_send_co, &data);
> > +    qemu_coroutine_enter(co);
> > +
> > +    while (!data.done) {
> > +        aio_poll(qemu_get_aio_context(), true);
> > +    }
> > +
> > +    return data.ret;
> > +}
> > +
> >  static void redirector_to_filter(NetFilterState *nf,
> >                                   const uint8_t *buf,
> >                                   int len)
> > --
> > 2.32.0
>


