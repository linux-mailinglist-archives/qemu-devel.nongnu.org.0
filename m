Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E10629CB4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxM6-00041G-DA; Tue, 15 Nov 2022 09:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouxLp-0003uF-Kn; Tue, 15 Nov 2022 09:55:50 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouxLo-0001Pv-8u; Tue, 15 Nov 2022 09:55:49 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-368edbc2c18so138869457b3.13; 
 Tue, 15 Nov 2022 06:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+BaSPsNjfiZWjhXMwtnu5/Z/I1lgcaUpsl/n7Zhqfqg=;
 b=R6NhuomeXdodJCS389aRm6QcJ/F5UY+Mzh125LtNWR4xyRnDvqQRpzIxWoGIXjwDUU
 xrtKPM/hbH0ovZ+0g3qNY5XjhC+Tg5jYOuIZr+nzjl1skK8BtRCYyrzMlRk3oXBZhvsI
 UzwOsb69Z/XAFxCkm+EGcrlDQCUlXiY08Y5ls3Duq9Bk4M7HYWSl8PQ0nPhISPqDAvMI
 UJh01E0skDjmeAdWLf9xzwIHWKBXN5gfBwVDy9z4GGJzOWISy6JPLHFwWcn8Q7cm4c7K
 r8Kv3eK/N3IpO8w1yAOOle5lNRQmffR5n/Jnrg/zvQhyVQ5rlxlEBpSmSUY46m+xpFjw
 thfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+BaSPsNjfiZWjhXMwtnu5/Z/I1lgcaUpsl/n7Zhqfqg=;
 b=6uLa1pQZ7KCdiAf1fsX8+IuEAZhifBKd0QQdV6PGCyXfm2eLrMxGPfd8gWemfwn8qT
 IJWZdues8dY/7+aHXHgRr4VZ5g3rmU1UvVD/i+/Mld1huwroJBYt1OT7Woi0hjKCO58G
 EZGVhOidDjZ60M9mt8HIMFxehmjNM37AK5WmNemnVpkXauIlzz4rINvMkYfUz5RPnogP
 5LwFzKUnakgvVyidSUFiYXXgIa1AnBbmQibRuYNw1DPWidZUIoQTyVPRyJEe9+Y7vXDE
 B+YAw3F3Gp6Et/jT4o0E7Wp3HekgsnAJ5nZ8rSNeejzdZpVxQl92BRT8ql6b3BqtWjjA
 r9ug==
X-Gm-Message-State: ANoB5plvAIQUx2UNPegyq2cUoXa+jr988uScYhsf4o7abkj44FAuH4Wh
 INg3CH/pLsB/6fXw+HjPp1eBbUsfPy3tsmBSEfs=
X-Google-Smtp-Source: AA0mqf6djBZmRylQ/Hn8zqeJqDuZUd8KZjpgO0aUMpLDp9pawnzh4vxdAK+E4qtm57IV1l6p3ko1H3vpxI6dtW42ImU=
X-Received: by 2002:a05:690c:a9c:b0:388:a098:bb1a with SMTP id
 ci28-20020a05690c0a9c00b00388a098bb1amr697359ywb.111.1668524145968; Tue, 15
 Nov 2022 06:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20221115121226.26609-1-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 15 Nov 2022 09:55:34 -0500
Message-ID: <CAJSP0QUS3t3Qse-Fm+hShc_qYaVf+D=ojoovcEc3pYqxUNAbhw@mail.gmail.com>
Subject: Re: [PATCH 00/30] Migration PULL request
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please resend as a GPG-signed pull request instead of as a patch series.

Thanks,
Stefan

