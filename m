Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0D475160
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 04:33:52 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxL38-00028T-SS
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 22:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mxL1K-0000ix-4r
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 22:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mxL1H-0006K3-Hu
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 22:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639539114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRa1nNnMEecoB23si751Mz7UBzP4AqVt4UxqK+JIoeE=;
 b=cde/TFULpFQrGeUvl08OIJMHeePeTmctuufyE1QNMzE/XuX+Y04AxboncxWTYYu0Dn9Ghn
 si6n82vM91693q1lW6DdqhftTFtq8VyHjEyzWrTAexH4wuDqDN5yWDlIQBAQYgu/ovFJO6
 6pI+s7/FHprDB1kJn915LsE3UluIFsc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-F8zHUKesP_ae6scY6K3E5A-1; Tue, 14 Dec 2021 22:31:49 -0500
X-MC-Unique: F8zHUKesP_ae6scY6K3E5A-1
Received: by mail-lj1-f197.google.com with SMTP id
 w16-20020a05651c103000b00218c9d46faeso6382601ljm.2
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 19:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRa1nNnMEecoB23si751Mz7UBzP4AqVt4UxqK+JIoeE=;
 b=T0hW6OxLM1hKzqZKYKEaDea2171b8v0UPft0I+2v1zRuVbiEj+L3qMx1SNZSL5Jrns
 pM8L+plh3CCiGYhbjx7s8NDMACNUg7fRaTbDnpwlybco8Viv05XSqQEEFBRy5VwUsCin
 NVwY4GB8tqEVmnVHquYrYI3juh9dXXQbjSgD5XGKnmybb3ZmAnyRjWsZxFh0Na4+DKTV
 50dr64fBnWNBY/cljHrmuPrG8UyCBHFjjatXMGkC/uiEuua+sMwXZlKC/uYw2O8gogId
 jLQjNqZARxZO3tTMROpXxFcMf2L/W19YFOxmYXo4apuc5hvBf4ezuEuCCi2tB/FJYn3r
 ISJA==
X-Gm-Message-State: AOAM530mn/qoVXpxZnPWOgQgKJk9os/wTadFRgd64w8Z2bmleCgucIKg
 Wovj4ffK4kO+zWcfEOupnD77VVS1+x9y6iJ4BeiHXwUiT0+6NxoEfdFGJQDLNo5S3lWC4zklGNl
 ILUrJSQ+PObBnDzfom2Y4U+LnPkCww2Q=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr8215478lfe.84.1639539107460; 
 Tue, 14 Dec 2021 19:31:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/oxjTx/LCg7UQXGRGvphbMJAVaGJCt8vmZTggRIvTC3kIN9gPPeqxkCzsWeiqCzLi4U5mTA+NknEUq4xaZDM=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr8215453lfe.84.1639539107030; 
 Tue, 14 Dec 2021 19:31:47 -0800 (PST)
MIME-Version: 1.0
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
 <20211214094355-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211214094355-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 15 Dec 2021 11:31:36 +0800
Message-ID: <CACGkMEvNyWxo-p3edf7Gdmv0tU8XLxzZfH4hOgzZZvtvNDH+KQ@mail.gmail.com>
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Sosedkin <asosedkin@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-discuss@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 10:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Dec 13, 2021 at 09:02:15AM +0100, Thomas Huth wrote:
> >  Hi!
> >
> > On 10/12/2021 18.02, Alexander Sosedkin wrote:
> > > With QEMU 5 I could totally issue a QMP netdev_add
> > > with the same ID to adjust the NetdevUserOptions I want,
> > > such as restrict or hostfwd. No deleting needed,
> > > just a netdev_add with what I want changed as a param.
> >
> > I'm a little bit surprised that this worked, since AFAIK there is no code in
> > QEMU to *change* the parameters of a running netdev... likely the code added
> > a new netdev with the same ID, replacing the old one?
> >
> > > With QEMU 6 it started failing, claiming the ID is already used.
> > > And if I do netdev_del + netdev_add, I just lose connectivity.
> > > What's even stranger, I still see old netdev attached in info network:
> > >
> > > > netdev_del {'id': 'net0'}
> > > {}
> > > > human-monitor-command {'command-line': 'info network'}
> > > virtio-net-pci.0:
> > > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> > >   \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> >
> > I think that's "normal" - there used to be problems in the past that the
> > devices (virtio-net-pci in this case) did not like the netdevs to be removed
> > on the fly. So the netdevs are kept around until you remove the device, too
> > (i.e. issue a device_del for the virtio-net-pci device).
> >
> > > > netdev_add {'type': 'user', 'id': 'net0', 'restrict': False, 'hostfwd': [{'str': 'tcp:127.0.0.1:58239-:22'}]}
> > > {}
> > > > human-monitor-command {'command-line': 'info network'}
> > > unseal: virtio-net-pci.0:
> > > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> > >   \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> > > net0: index=0,type=user,net=10.0.2.0,restrict=off
> > >
> > > What's the correct QMP command sequence to modify NetdevUserOptions?
> >
> > AFAIK there is no way to modify running netdevs - you'd have to delete the
> > netdev and the device, and then add both again. But I might have missed
> > something here, so I CC:-ed some people who might be more familiar with the
> > details here.
> >
> >  Thomas
> >
> >
> > > Please CC me on replies.
>
>
> Wow this really goes to show how wide our feature matrix is.
>
> Yes it's probably an unintended side effect but yes it
> did work it seems, so we really should not just break it
> without warning.
>
>
> Probably this one:
>
> commit 831734cce6494032e9233caff4d8442b3a1e7fef
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Wed Nov 25 11:02:20 2020 +0100
>
>     net: Fix handling of id in netdev_add and netdev_del
>
>
>
> Jason, what is your take here?

I might be wrong, but I agree with Thomas. Adding a netdev with the
same ID looks wrong, if it works, it looks like a bug. And I don't
think we support changing netdev properties.

Thanks

>
>
> Alexander, what happens if we just drop the duplicate ID check? Do
> things work for you again?
> Warning: completely untested.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> diff --git a/net/net.c b/net/net.c
> index f0d14dbfc1..01f5a187b6 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1055,12 +1055,6 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>          }
>      }
>
> -    nc = qemu_find_netdev(netdev->id);
> -    if (nc) {
> -        error_setg(errp, "Duplicate ID '%s'", netdev->id);
> -        return -1;
> -    }
> -
>      if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
>          /* FIXME drop when all init functions store an Error */
>          if (errp && !*errp) {
> --
> MST
>


