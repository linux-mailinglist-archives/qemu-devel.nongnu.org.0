Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB947B3AD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:26:19 +0100 (CET)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOIc-0007wC-O6
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:26:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzNvn-0003my-Jb
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzNvk-0006VI-Py
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640026959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xrQjj/AUj1IPOd4XjXuuxfloyvNeLoJszesj/wYOTE=;
 b=Hsiv8r+RNQjWAZGWXp3x/mKcvpJiHjXfss6D+Jjigp2eErAbbYjo1a8KbB+2a1/9Q7ksK4
 ViD/fLbFo3HUvGKXvwb8bdoV9/cPm6KyvJ3qx0/nLV6h4fJavZQcr9NPKDjWcjpcDYTGoH
 czHhvpjaOuHy0+iTfVNLDg8+Nv4gBAs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-E0yDNSsWPgWtPPATPiq7_w-1; Mon, 20 Dec 2021 14:02:38 -0500
X-MC-Unique: E0yDNSsWPgWtPPATPiq7_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso3858765wrd.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2xrQjj/AUj1IPOd4XjXuuxfloyvNeLoJszesj/wYOTE=;
 b=pi/wHDWHYKFlwfAu+D169/kI11FfUzp15707JYrL4DuVrF9yktAQRkMPE8Mc04cOTx
 9Mli0VDLA/0Ym251mKs96VUnHuTyYrg8svIxUZYg5Ak9R9zLMnF/YKws3SlzzAp4D+6D
 PDmSAGjk0GsoGBlYdj9urWBWbeitHVWWCwkiHWWcy7lUc4Fzn2D3yqobJuznhJQVT9Du
 d3S51ik1qjrRcwP+xnA10ncz8Z3fSy0ZRqz8cj+UrwETM5/BRuMLwT1dhdSFto1FjGSg
 dbEGHGA/je0q6WC0eKUTu8HwJKh9JMqtpGuU+vftWW20eIEP3tO4sQ0sWygsY68FL2xk
 2j4Q==
X-Gm-Message-State: AOAM530/ukkhcuRj2Mq3/Qw6OQj1+DYpCntpJMby4VFjGrGG3YIf3uiz
 SMm7ho12lflkKA3wm3cZD7USAUCYgVameGf7+8LytJS/EPmTloHxMAdnhnobiA8ZUHSxKYY0dwW
 mrxEAxYcABsQkm/4=
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr312596wmq.29.1640026957371; 
 Mon, 20 Dec 2021 11:02:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIBjdWkuxlvd9a8PngMt8y6AXz++kO9+8QPttiupKf1UVvkAK/GpvPiEaKPSm6A2KBQPqDAQ==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr312579wmq.29.1640026957185; 
 Mon, 20 Dec 2021 11:02:37 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id r5sm11869468wrj.4.2021.12.20.11.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 11:02:36 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/5] migration: We only need last_stage in two places
In-Reply-To: <22922310-4041-9f72-7f8b-1426a073199e@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Dec 2021 10:30:12
 +0100")
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-3-quintela@redhat.com>
 <22922310-4041-9f72-7f8b-1426a073199e@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Dec 2021 20:02:35 +0100
Message-ID: <87ee67je0k.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> On 12/16/21 10:13, Juan Quintela wrote:
>> And we are passing it all around.  Just add a field to RAMState that
>> passes it.
>
> Splitting half of the description in the subject makes it hard to read.
> Better to repeat the subject as first description line. Matter of taste.

I don't care enough to fight it.

Changed O:-)

Thanks, Juan.


