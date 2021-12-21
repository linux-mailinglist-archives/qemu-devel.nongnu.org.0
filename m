Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D747C0FA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:47:18 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfU4-0001tO-U9
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:47:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mzfSD-0000ZS-84
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mzfS9-0002j3-P2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640094315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oADHQGX+h+SivOl9CAxotPX4Y4sWzhXuqag+Kj/HoA=;
 b=JLSJXEmaM7v7bE6d8cMPiNsoggrIjR0cN9oEDKhco7DOE+1HKst8KzJoO0NhZeh6GLsaSw
 Gy0qeDmPNEqokhQT209hkFuD1NYiiWs/ny4U1o9AIKQHcqugzdF9DEMWPOCStdllyl4LFR
 kgcxUQIMeF08AGgsHjvGBDA0AvxRKg0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-AnkyNA2kO5eGgsWrX-q7KQ-1; Tue, 21 Dec 2021 08:45:14 -0500
X-MC-Unique: AnkyNA2kO5eGgsWrX-q7KQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 r4-20020a654984000000b0033ae6493472so8931971pgs.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 05:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6oADHQGX+h+SivOl9CAxotPX4Y4sWzhXuqag+Kj/HoA=;
 b=bLPnhcPPe/Rv+1Amg9WSVgpm8ISDPaCU39O1f8L2zLCp75zaL07/qEQTGm0hI0HqST
 hUXZm/5CfBlCu6cB47Ig+Irq/3xPlqKUMV7HZe6T9COoDUqncHRKK+PLTV82lEa7guKJ
 cw+N3WN75zFxWj0aMOo1BthjqgWmcxyamtIGC4diWK0iNyv/JDfSfC+ANbsSDUYfP619
 yn3UHWZ07s9V5af7wrU7rJJxTPgWDQIOz+1B+YsEGA9AFjKqBbjmiKayRoTSs74hoydb
 Frt2VTsDLft2ZyRxndIsU9xysL8izJvG4AFTPlIc/kIMOdfqebZOOO5OY4BNO1KLiNsG
 Js1w==
X-Gm-Message-State: AOAM530d6zhdwCoPhlJQqQwqSuuwmf6DwHbrROI+XcXCCbi78T+kecyr
 iMA4VzoJF+ymJM0hCSh+0ngoIkyzkA7Yz+n2m6fyVDfe1CECSN/urUWnDwQ0Ixtp0OelHAGIjMi
 8LKHCFWv7p88C6rIIXC0zadjev1q19qc=
X-Received: by 2002:a63:b50d:: with SMTP id y13mr2980656pge.286.1640094313683; 
 Tue, 21 Dec 2021 05:45:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNts9KbioFGSzh4skNtcc47ne9UEG70HV9M9ZiG+ncFwBVLKzkKjVCLQMVh0eXNMUfoe5Ju6n+qumMWV+yn58=
X-Received: by 2002:a63:b50d:: with SMTP id y13mr2980622pge.286.1640094313406; 
 Tue, 21 Dec 2021 05:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211221133759.6579-1-vsementsov@virtuozzo.com>
In-Reply-To: <20211221133759.6579-1-vsementsov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Dec 2021 17:45:02 +0400
Message-ID: <CAMxuvayLUHGvooCw1ZunRynsVZtb8WCxCrOR49XiNy99cXLZaA@mail.gmail.com>
Subject: Re: [PATCH 3/2] avocado/vnc: add test_change_listen
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: bleal@redhat.com, Philippe Mathieu Daude <philmd@redhat.com>, "Armbruster,
 Markus" <armbru@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, "Bonzini, Paolo" <pbonzini@redhat.com>, "Blake,
 Eric" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 5:38 PM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> Add simple test-case for new change-vnc-listen qmp command.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks

> ---
>  tests/avocado/vnc.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
> index 096432988f..f05ee1e00a 100644
> --- a/tests/avocado/vnc.py
> +++ b/tests/avocado/vnc.py
> @@ -51,3 +51,13 @@ def test_change_password(self):
>          set_password_response =3D self.vm.qmp('change-vnc-password',
>                                              password=3D'new_password')
>          self.assertEqual(set_password_response['return'], {})
> +
> +    def test_change_listen(self):
> +        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
> +        self.vm.launch()
> +        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], =
'5900')
> +        res =3D self.vm.qmp('change-vnc-listen', id=3D'default',
> +                          addresses=3D[{'type': 'inet', 'host': '0.0.0.0=
',
> +                                      'port': '5901'}])
> +        self.assertEqual(res['return'], {})
> +        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], =
'5901')
> --
> 2.31.1
>


