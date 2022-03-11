Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC604D5F1C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:06:52 +0100 (CET)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nScAc-0005rG-Ig
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSc8H-0004A2-Hn
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSc8G-0002PG-2H
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646993063;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Us0O3GTX5sp9HfXs73q0QLbZM40lKwC3JSWS5WLGc0Q=;
 b=ajP1zYKvuzAFwRBo0Gt5f/WKqQvJ+RMXFHJpVmUO5NWpBQd97Yv4uBnLPEcYjWGRWlSUX8
 pssCecr3Ra82maB4KIl+DPRLPdgHxQnDzxI2Z7rIwS6gqQ/LJQfXwdlEfzgE8GfYojFIe0
 xC2Hk62K96+gRpNVOon3oGyUdlGNNIM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-5JQiOmMHOb23DL19FKt2JA-1; Fri, 11 Mar 2022 05:04:22 -0500
X-MC-Unique: 5JQiOmMHOb23DL19FKt2JA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so2629164wra.0
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Us0O3GTX5sp9HfXs73q0QLbZM40lKwC3JSWS5WLGc0Q=;
 b=BhU9hu3luLEx6aJjf7SsreDnRCjZZFjoBv+TSEiTYAPErqKmftqSuJB7IhzVHQbKOW
 CGEa/95n8Oeddl47hlFxsCXDtR6w8dSpzcj8M/pVtefpWGteuCfeJSMT3zeZ2QLbqbHl
 0K4s/vD5lvJ82DmgHOEW5Z83feTD++MJD7wXtBPovnrOlBSlM6HE5O382de5cZuwreha
 zW02PeEkn+sUXI2QYtekr8IwY6y4LhtSW5LFHBQG6iLeUBYSD2+EPVE7sQMQdT+Wv07e
 eqI15wWZYRlKiOF40WHqOVRucl7Q0rI1qsGoj5KwKbjDuZkLnFq9nL3wVmLSsG8LhJLn
 gusQ==
X-Gm-Message-State: AOAM53207VrPrXedlozwUMN/B0o7Mj3aUSLMhGxU4EXUVqJyngpVoc4I
 cV73cKWwC8GCC8zV+ZJCGFqbrFWHWC83e+QvaQtmqyXTf61UU9A1rRSMDdmu7vzNMQw2F6n6htf
 jJVZjugq6335FiiM=
X-Received: by 2002:a05:600c:2846:b0:389:9347:9aaf with SMTP id
 r6-20020a05600c284600b0038993479aafmr14776894wmb.87.1646993061323; 
 Fri, 11 Mar 2022 02:04:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQFzewINGJ79f+mVwwRz8+8Y4I6aFqPMbxuqF/54lsYP6pAj85akkMZGYM0CfdeM1GtCZ6Cw==
X-Received: by 2002:a05:600c:2846:b0:389:9347:9aaf with SMTP id
 r6-20020a05600c284600b0038993479aafmr14776881wmb.87.1646993061115; 
 Fri, 11 Mar 2022 02:04:21 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4941000000b001ed89dcacbbsm6243517wrs.23.2022.03.11.02.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:04:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 03/18] tests: support QTEST_TRACE env variable
In-Reply-To: <20220310171821.3724080-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 10 Mar 2022 17:18:06
 +0000")
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-4-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 11 Mar 2022 11:04:18 +0100
Message-ID: <87y21giz4t.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> When debugging failing qtests it is useful to be able to turn on trace
> output to stderr. The QTEST_TRACE env variable contents get injected
> as a '-trace <str>' command line arg
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Great.  I have had a crude version of this (i.e. just changing the
command line for ages).


