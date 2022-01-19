Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A649322E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 02:12:24 +0100 (CET)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9zWR-0003Zx-CP
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 20:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9zSI-0002SK-EX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 20:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9zS1-0006MF-KC
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 20:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642554467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkIslYbtqkR1Ggl8HLF+HCwR7DrGwBtPlK2mryYULR0=;
 b=MT7zfnKP3FTho0YF895BEv36w41EOFOWCunLePFG4Mi3SK8lFg7w0Ax2SqBEDVCBF5ScYo
 Vqowx+YFvxcwwEVT4FjY6pNkJkFG2RUev1kvag/1w0OLCm4PCmaV58CwG+q4iqgJI+08Aw
 qs38up7LgD89UXN+VMK5ur51Qda7LDo=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-_rYxYRR2PTeZXdGojtvQOQ-1; Tue, 18 Jan 2022 20:07:44 -0500
X-MC-Unique: _rYxYRR2PTeZXdGojtvQOQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 c9-20020ab056c9000000b0030608ab526dso495365uab.14
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 17:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GkIslYbtqkR1Ggl8HLF+HCwR7DrGwBtPlK2mryYULR0=;
 b=JGn6UWie9pFc6zyRp6jfOwEQQvUU5076QqawAwSdMInjoe6Rs55OSy1mXk8Td+DpKx
 dkVjn+E6Tp9DcV1pgDioNsanVTeHZFZBYCEqYnoZP3d34K5bJl/McmZg9H0m8wSD5lTT
 919hLtISAjHltGroanLta0XyudU9gfFvxKFrO7yH6S5sNKRVWHXiAlyR2aQSVqu0RGg1
 KPMznd+7Ol2atewTrB2317UzJu7fKtsA/SNqfEeLyyV727DKQG5u/BqVePlxfMdkE54S
 ohOY2cNNNrjQ6TSkR0SbrC0NIj7fa0gbondO8bkfT5apxhc9iuqWflEOx9oPj3+6S4yw
 7ylg==
X-Gm-Message-State: AOAM533mDWwd/4ZrBJ15dYyAuJsDxKrmXH5QHLPn4MQ5PVc0VsaRNlLA
 NFiUwxl7p8q1W+EQXAFQDruqUFC9aHR7PO/SvsYmDlG/y3Mk/tPNWckjId752N/BW3PY9lrmFm0
 8Nd9jYD07IrbVUEOh3ozM2AJPaxWr08c=
X-Received: by 2002:ab0:678f:: with SMTP id v15mr3026293uar.87.1642554463742; 
 Tue, 18 Jan 2022 17:07:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNgk4r54Mr0WyEAlCJC/Ov2F+hVNdHnM7LgY0Dmw1GwXF0vYueoy398U9yvXbaZBIjLkElKoZCoLecV6J4ICQ=
X-Received: by 2002:ab0:678f:: with SMTP id v15mr3026288uar.87.1642554463504; 
 Tue, 18 Jan 2022 17:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20220118100140.252920-1-berrange@redhat.com>
 <20220118100140.252920-2-berrange@redhat.com>
In-Reply-To: <20220118100140.252920-2-berrange@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 18 Jan 2022 20:07:32 -0500
Message-ID: <CAFn=p-Ytc=9mmWqPKyrXRY2EFOKsyZ3akw8z=F6g1af6jgq0ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] python: introduce qmp-shell-wrap convenience tool
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 5:01 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> With the current 'qmp-shell' tool developers must first spawn QEMU with
> a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> pointing to the right socket.
>
> With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> just pass the QEMU command and arguments they want. The program will
> listen on a UNIX socket and tell QEMU to connect QMP to that.
>
> For example, this:
>
>  # qmp-shell-wrap -- qemu-system-x86_64 -display none
>
> Is roughly equivalent of running:
>
>  # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
>  # qmp-shell qmp-shell-1234
>
> Except that 'qmp-shell-wrap' switches the socket peers around so that
> it is the UNIX socket server and QEMU is the socket client. This makes
> QEMU reliably go away when qmp-shell-wrap exits, closing the server
> socket.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks, I think this is pretty useful.

Can you look at setup.cfg and see about adding a qmp-shell-wrap entry
point there? I had intended to wean people off of using /scripts for
things that rely on the QMP packages, because I'm gonna fork them out
and then these little forwards won't work without installing something
anyway.

Also, as an FYI: Stuff that sticks around in /python/qemu/qmp/ is
going to get forked out and uploaded to PyPI; stuff that gets added to
/python/qemu/utils is going to stay local to our tree and has more
freedom to be changed liberally. If you don't think this script
belongs on PyPI, we could always stick it in util.

--js


