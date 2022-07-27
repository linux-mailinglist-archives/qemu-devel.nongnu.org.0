Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79BD58292D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:00:37 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiWZ-0003n9-B3
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiSB-0007f6-A3; Wed, 27 Jul 2022 10:56:03 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiS9-0000I4-Lg; Wed, 27 Jul 2022 10:56:03 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id o15so2519608yba.10;
 Wed, 27 Jul 2022 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DTlTDAEkY7qM5k84OfZJwfDULKTVL+ukekpS7hHm68=;
 b=j7rqjdWjZGExk46FjvSZq7jGmb1e4SJmBJN8mfRgeeW9caq/fzfGzmK9rR7+ruzrxb
 /9Ly/90MQ/pbKPLVTTkenSpL373s2l64SZFabWQxPqns6l3QfjdoPdshAC2/GLXlQUp1
 yHIwKHBVnjweIja+cC0iczbNfCv2G5rUxWHRGVIUIUMdB6lsznnMCZN874yT0wzWTk7c
 nuL7EQ02jbA3W0pxqBRhf/PHg3pixoW/kTEsbkXCsELeBxUZdUd7oGXr004fXtWR/GND
 pQynF9YkZWOr1klByhmTw1lo2FZ8qSoBUvcheFN6Ia7X+2ked2kdk7Xi339EDmJMJFgM
 S/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DTlTDAEkY7qM5k84OfZJwfDULKTVL+ukekpS7hHm68=;
 b=juMnYC51fbk6kbH8+4sq+k65h8FvtZ1lBue2GgmInF+YlTheluHB/zUY78+mV/0wy1
 ohxHgOhtQOWwf9ZkDWkwHK3V+keP4yOcDiIET1nbtEV45n4drnGZRcLgZ5fUvy0QD56k
 VbBCiAZjfsnXW/ii7gE1QfCbGiEyU2pbio1ZWEKZ/JnVCZbwhP7qWjrTwlOyAkiT3kSe
 jXBdt7sbnnZ1C7KplhQvwyudLPzlAY/mltjbInLXSrI4R7nAHQNfiW5SreJsfuAevzWJ
 pJyP1UxviD7eG1N9MY9fRjXc82F4SUuxaEWBh795g91QdvN5zTrRg0Vj0ftPq18bFO3G
 jT/A==
X-Gm-Message-State: AJIora/THNxi2HwAU55OEtC0FS36SqpR50bkFO3xH4zLnSKjWbXYuOMb
 qr5bb17Y3+cFl1GDKCt11NCxif8NhrDOU9XObbSjprvlsndqSg==
X-Google-Smtp-Source: AGRyM1vL5o2WGS21TjdDAp/hrgYqoOpFBVUhN83C7+jn4wUBADtaby6+qNNHW3EZ2xcQpQlOfrBmNikNpCFNd50QfBI=
X-Received: by 2002:a25:238d:0:b0:673:4607:acf4 with SMTP id
 j135-20020a25238d000000b006734607acf4mr642819ybj.209.1658933760419; Wed, 27
 Jul 2022 07:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:55:48 -0400
Message-ID: <CAJSP0QWJfsXUBOwMAvjb+NysrUUtwokaVWkkWOk4kZtNh_Tm_g@mail.gmail.com>
Subject: Re: [RFC v4 0/9] Add support for zoned device
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 at 22:17, Sam Li <faithilikerun@gmail.com> wrote:
>
> This patch series adds support for zoned device to virtio-blk emulation. Zoned
> Storage can support sequential writes, which reduces write amplification in SSD,
> leading to higher write throughput and increased capacity.

Please use "git rebase -i master" and add "x make" lines after each
commit to check that the code still builds after each commit. It is
important to order patches so that each commit still builds
successfully. That way git-bisect(1) works and patches can be
backported/cherry-picked.

Stefan

