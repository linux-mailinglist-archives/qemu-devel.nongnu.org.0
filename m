Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D54D5F48
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:19:18 +0100 (CET)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScMf-0006Rz-1c
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:19:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nScKx-0005cx-NQ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nScKu-0004b4-LR
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646993846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0ex6P66cxWWyvC0+g46ZJDIce7d+gYF45z/ZhH5N6I=;
 b=Pu3X8xWJLSKS3qiVIWangqxhOx6YmgnY6V72iW0qS8VHMhP+by9R3cUDBJuyhl3fIi3pHc
 SNElVnJ/m8IEGgLuoz7HCBjPjV3sGHeEc34LMSA3kfix1VM2ttJaB67k7dF7nLEd697TK9
 RhdZS6Lqso0iTodm6+suTkQB/j5/jLM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-0q4O_f1kMi-yfKsdptFOkg-1; Fri, 11 Mar 2022 05:17:25 -0500
X-MC-Unique: 0q4O_f1kMi-yfKsdptFOkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso3073423wml.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=I0ex6P66cxWWyvC0+g46ZJDIce7d+gYF45z/ZhH5N6I=;
 b=N50ZBWWvj4JoQzg6OWE49YSu702hGZiz3fiioRVo/+1f6kBnZQuJWu8UkEGiDOh3xR
 zGr5o/hQ5T/B8eM4GXAbxgcjoCDAQlEGWsKKHRoxCJind67gANJ9rgZhZQQwQBzSmPIu
 IDy89kMP9hNye8LkTKPhUYYbzGEBxMQTSMVZ23GguJ9iW3QbHgrEJIP+SJESYQ0bzE1I
 7hLaEhJSHDOMcrlQP1WmE6moydZrgri7+hU0MAm8zqYsElHBOXTsP4QklsyiNcS8h4Mx
 H4/v5jeI8dVYq/hGQ9SdIYMso3r/nw/hMDOaLGjxYR9D085ZajGR+lxTGFNBDa6U7fSt
 Y8RQ==
X-Gm-Message-State: AOAM530A5WwbqExfVyqJH5QB/Fbp9cFg0+v0Byk8GRk2hjKhUktXRiLf
 xi3h4Paj9bgFgJvTxIGX0nquXll4c6OyfUafbSa8AvH4mntO3e5kRA7kzPRp7dmmp4wW8fXLBoF
 gTceJXlQUIqrq3p8=
X-Received: by 2002:adf:eb89:0:b0:1e4:b8f4:da74 with SMTP id
 t9-20020adfeb89000000b001e4b8f4da74mr6858261wrn.408.1646993844659; 
 Fri, 11 Mar 2022 02:17:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAmYKqnvkAT/t24lB/fwLlBGRrInUulGPO4RNZS3vag8PnTevJzP9n4CK6WchdIYH23uCGeg==
X-Received: by 2002:adf:eb89:0:b0:1e4:b8f4:da74 with SMTP id
 t9-20020adfeb89000000b001e4b8f4da74mr6858248wrn.408.1646993844469; 
 Fri, 11 Mar 2022 02:17:24 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:3506:3400:69b5:c807:1d52:ff67?
 ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm10310490wma.25.2022.03.11.02.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:17:24 -0800 (PST)
Message-ID: <50ce51c3a8f84d53b64fba396b19e5a1d11b1e19.camel@redhat.com>
Subject: Re: [PATCH v2 2/4] Introduce event-loop-base abstract class
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Fri, 11 Mar 2022 11:17:22 +0100
In-Reply-To: <YinSD8xxujd5lOSy@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-3-nsaenzju@redhat.com>
 <YinSD8xxujd5lOSy@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-03-10 at 10:25 +0000, Stefan Hajnoczi wrote:
> On Thu, Mar 03, 2022 at 03:58:20PM +0100, Nicolas Saenz Julienne wrote:
> > @@ -2935,13 +2947,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
> >                               capture: true,
> >                               command: [undefsym, nm, '@INPUT@'])
> >  
> > -qom_ss = qom_ss.apply(config_host, strict: false)
> > -libqom = static_library('qom', qom_ss.sources() + genh,
> > -                        dependencies: [qom_ss.dependencies()],
> > -                        name_suffix: 'fa')
> > -
> > -qom = declare_dependency(link_whole: libqom)
> > -
> 
> Why was it necessary to move qom_ss and subdir('hw') up? Can
> event_loop_base be defined down here instead?

The way I setup it up, qemuutil now depdens on event_loop_base which in turn
depends on qom. IIUC I can't declare dependencies without declaring first the
libraries and source sets. All has to happen sequencially. With this in mind,
almost all libraries depend on libqemuutil so moving it down isn't possible.

subdir('hw') was also moved up, as 'hw/nvram/meson.build' is introducing files
into qom_ss. This operation has to be performed before declaring libqom.

> (The benefit of less code churn is it reduces the risk of patch conflicts.)

Agree, I know how painful it can be for backports.

Thanks,

-- 
Nicolás Sáenz


