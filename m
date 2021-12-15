Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2972475ABA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:36:47 +0100 (CET)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVOg-0001C6-Tu
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:36:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asosedki@redhat.com>)
 id 1mxUUQ-0004I6-9a
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asosedki@redhat.com>)
 id 1mxUUM-0008Ja-GO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639575513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EN8LkGhHd3Q0x5icwFtDKBdROei/gIEV9KsC4I9ngYE=;
 b=gAygtSQv+mkeG4SWbZt7jij3OJsxOl3+SmH1QqqCGl5YcPnYI7rTnT7cW9oY+Enhy90+3A
 2XKzvIwyRG72RA90bKQ285K/dHav8JY4FIfX241RDHJUPBSvfa3w3uqX1iFAG7X9u0gSZ3
 RzGsFXvhEo9G189a7LKTPSZ4A985x9Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-Rjd8dIhRPAClvO2lIb0eww-1; Wed, 15 Dec 2021 08:38:20 -0500
X-MC-Unique: Rjd8dIhRPAClvO2lIb0eww-1
Received: by mail-lj1-f198.google.com with SMTP id
 i14-20020a2e864e000000b00218a2c57df8so7002810ljj.20
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hQNaKaCfqOwaky0cT+zkXti/hFUWDPBb64Zq7IYIVlE=;
 b=o7l6ndos1d2ptaV3wHf+GbPHsJEYdO174EFtuNJcEPQbaTv5H3x93CXxzScjMji1/V
 80qZkQOtIeOQpJ6Aqet+n8X19RPEcA0gmYT5Nv8Ktpu3r8xpmS+QZ+EW4aU2WPJO09nN
 zoFbwj2bF+VsxZWSpcvmqfRvDLt1ywvgiT97COhM5DVjKfLEsLSGTMciVR3pLRes/bVS
 Tpk01MCF1MK3hLiIvJjpiql2a4mL+95z9/0fk2bLPYTp8Hdal7DFAgN5eTUmW5eHWd3I
 3Hl5qt0+ORcYgys68X8C1JZN6ddWxleabM3vO/k+FkRvs8pi88RsKZgX9zilipGvdCsB
 Di+Q==
X-Gm-Message-State: AOAM532/UweylnmRINltppjSpIBGOKcCCgIJ0LxCL0q+iqc0vqnBnNhq
 uH3K+6Ennh2lCl0hHLVfSZzNjBpOmNY5hbEAwoVwwUtKKSlJcjIMGCSoj6iWXxxbeJHVmdrTHGF
 WQ4n/RFfVmK2ibbzC2ZhlLVlCeqqJs0o=
X-Received: by 2002:a05:6512:15a7:: with SMTP id
 bp39mr10016369lfb.145.1639575499157; 
 Wed, 15 Dec 2021 05:38:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0rU82T+pTHWsISlJgNjyCjGi3DVi80CpunArtI5Jkd8ATzu/DNXLzLYlrDyCn38lPXCj9uCxnKBeKWIILlLQ=
X-Received: by 2002:a05:6512:15a7:: with SMTP id
 bp39mr10016347lfb.145.1639575498783; 
 Wed, 15 Dec 2021 05:38:18 -0800 (PST)
MIME-Version: 1.0
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
 <20211214094355-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211214094355-mutt-send-email-mst@kernel.org>
From: Alexander Sosedkin <asosedkin@redhat.com>
Date: Wed, 15 Dec 2021 14:38:02 +0100
Message-ID: <CABMV8QMorCnZqe8wS2LSEvnR0QQJi2PwMCuEDDWejj6eqmdGmg@mail.gmail.com>
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=asosedki@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0000000000003082b405d32f6b7e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=asosedki@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Dec 2021 09:13:25 -0500
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-discuss@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003082b405d32f6b7e
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 3:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Dec 13, 2021 at 09:02:15AM +0100, Thomas Huth wrote:
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

For real. I consider myself an amateur QEMU abuser
and I can use the tiny corner I've worked with as a blanket.

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

> (in other email)
> Got a reproducer for me so I can double-check?

Yeah, I've sketched one out in Python, see attachments.

qemu-netdev-reproducer.py sets up a user netdev with restrict=off,
then netdev_adds a weird thing, unrestricting and adding a hostfwd entry.

qemu-netdev.qemu5.log is the output of it reconfiguring great on Fedora 34,
even though it adds a duplicate netdev judging by `info network`:
\ net0: index=0,type=user,net=10.0.2.0,restrict=on
\ net0: index=0,type=user,net=10.0.2.0,restrict=off

qemu-netdev.qemu6.log is how it fails with duplicate ID now
(vendor=nixpkgs, but I've seen same error reports from Fedora 35):
{'error': {'class': 'GenericError', 'desc': "Duplicate ID 'net0'"}}

qemu-netdev.qemu6-nocheck.log is the behaviour with your patch applied,
behaving the same way QEMU 5 does.

Hope that answers all the questions from the thread;
if not, please re-raise your questions and I'll do my best to answer
them timely.

Just to stress it,
I'm not barging in with "you broke the old behaviour, revert things".
I recognize that I've been doing weird things and
merely ask what's the way forward to get the features I used to have access to.
Not gonna lie, I would like to see it reverted,
but having a proper way to reconfigure would be even better.
Thank you.

--0000000000003082b405d32f6b7e
Content-Type: text/x-python; charset="US-ASCII"; name="qemu-netdev-reproducer.py"
Content-Disposition: attachment; filename="qemu-netdev-reproducer.py"
Content-Transfer-Encoding: base64
Content-ID: <f_kx7k0o5n0>
X-Attachment-Id: f_kx7k0o5n0

IyBmbHVmZgoKaW1wb3J0IGF0ZXhpdAppbXBvcnQganNvbgppbXBvcnQgc29ja2V0CmltcG9ydCBz
dWJwcm9jZXNzCmltcG9ydCB0aW1lCgpRTVBfUE9SVCA9IDEyMzQ1ClRFU1RfUE9SVCA9IDEyMzQ2
ClFFTVUgPSAncWVtdS1zeXN0ZW0teDg2XzY0JwpBUkdTID0gWyctbm9ncmFwaGljJywKICAgICAg
ICAnLXFtcCcsIGYndGNwOjEyNy4wLjAuMTp7UU1QX1BPUlR9LHNlcnZlcixub3dhaXQsbm9kZWxh
eScsCiAgICAgICAgJy1kZXZpY2UnLCAndmlydGlvLW5ldC1wY2ksbmV0ZGV2PW5ldDAnLAogICAg
ICAgICctbmV0ZGV2JywgJ3VzZXIsaWQ9bmV0MCxyZXN0cmljdD1vbiddCgpwID0gc3VicHJvY2Vz
cy5Qb3BlbihbUUVNVV0gKyBBUkdTLCBzdGRvdXQ9c3VicHJvY2Vzcy5ERVZOVUxMKQphdGV4aXQu
cmVnaXN0ZXIocC5raWxsKQoKc29jayA9IHNvY2tldC5zb2NrZXQoc29ja2V0LkFGX0lORVQsIHNv
Y2tldC5TT0NLX1NUUkVBTSkKc29jay5zZXRzb2Nrb3B0KHNvY2tldC5JUFBST1RPX1RDUCwgc29j
a2V0LlRDUF9OT0RFTEFZLCAxKQp0aW1lLnNsZWVwKC4yKQp0cnk6CiAgICBwcmludCgnUU1QIGNv
bm5lY3RpbmcsIGF0dGVtcHQgMS8yJykKICAgIHNvY2suY29ubmVjdCgoJzEyNy4wLjAuMScsIFFN
UF9QT1JUKSkKZXhjZXB0IENvbm5lY3Rpb25SZWZ1c2VkRXJyb3I6CiAgICBwcmludCgnUU1QIGNv
bm5lY3RpbmcsIGF0dGVtcHQgMi8yJykKICAgIHRpbWUuc2xlZXAoMikKICAgIHNvY2suY29ubmVj
dCgoJzEyNy4wLjAuMScsIFFNUF9QT1JUKSkKcHJpbnQoJ1FNUCBjb25uZWN0ZWQuLi4nKQoKCmRl
ZiBleGVjdXRlKGNtZCwgKiprd2FyZ3MpOgogICAgc29jay5zZW5kKGpzb24uZHVtcHMoCiAgICAg
ICAgeydleGVjdXRlJzogY21kLCAnYXJndW1lbnRzJzoga3dhcmdzfSBpZiBrd2FyZ3MgZWxzZSB7
J2V4ZWN1dGUnOiBjbWR9CiAgICApLmVuY29kZSgpKQogICAgcHJpbnQoJ2V4ZWN1dGVkOicsIGNt
ZCwga3dhcmdzKQoKCmRlZiBleHBlY3QodmFsaWRhdG9yX2Z1bmM9Tm9uZSk6CiAgICByID0gYicn
CiAgICB3aGlsZSBUcnVlOgogICAgICAgIHIgKz0gc29jay5yZWN2KDEpCiAgICAgICAgaWYgclst
MV0gPT0gb3JkKCdcbicpOgogICAgICAgICAgICByZXBseSA9IGpzb24ubG9hZHMoci5kZWNvZGUo
KSkKICAgICAgICAgICAgcHJpbnQoZidyZWNlaXZlZDoge3JlcGx5fScpCiAgICAgICAgICAgIGlm
IHZhbGlkYXRvcl9mdW5jIGlzIG5vdCBOb25lOgogICAgICAgICAgICAgICAgYXNzZXJ0IHZhbGlk
YXRvcl9mdW5jKHJlcGx5KQogICAgICAgICAgICByZXR1cm4gcmVwbHkKCgpleGVjdXRlKCdxbXBf
Y2FwYWJpbGl0aWVzJykKZXhwZWN0KGxhbWJkYSByOiAnUU1QJyBpbiByKQoKCiMgaW5zcGVjdCBh
cyBzdGFydGVkIHVwCgpleGVjdXRlKCdodW1hbi1tb25pdG9yLWNvbW1hbmQnLCAqKnsnY29tbWFu
ZC1saW5lJzogJ2luZm8gbmV0d29yayd9KQpleHBlY3QobGFtYmRhIHI6IHIgPT0geydyZXR1cm4n
OiB7fX0pCnJlcGx5ID0gZXhwZWN0KGxhbWJkYSByOiBzZXQoci5rZXlzKCkpID09IHsncmV0dXJu
J30pCiMgU2hvdWxkIGJlOgojIHZpcnRpby1uZXQtcGNpLjA6IGluZGV4PTAsdHlwZT1uaWMsbW9k
ZWw9dmlydGlvLW5ldC1wY2ksbWFjYWRkcj0uLi4KIyAgXCBuZXQwOiBpbmRleD0wLHR5cGU9dXNl
cixuZXQ9MTAuMC4yLjAscmVzdHJpY3Q9b24KYXNzZXJ0KCdyZXN0cmljdD1vbicgaW4gcmVwbHlb
J3JldHVybiddKQpwcmludCgpCgoKIyBtb2RpZnkKCmV4ZWN1dGUoJ25ldGRldl9hZGQnLCB0eXBl
PSd1c2VyJywgaWQ9J25ldDAnLAogICAgICAgIHJlc3RyaWN0PUZhbHNlLCAgIyB1bnJlc3RyaWN0
CiAgICAgICAgaG9zdGZ3ZD1beydzdHInOiBmJ3RjcDoxMjcuMC4wLjE6e1RFU1RfUE9SVH0tOjEn
fV0pCiAgICAgICAgIyBeICpub3QqIGEgbGlzdCBvZiBzdHJpbmdzIGFzIHRoZSBkb2N1bWVudGF0
aW9uIGNsYWltcwoKCiMgaW5zcGVjdCBtb2RpZmllZAoKZXhlY3V0ZSgnaHVtYW4tbW9uaXRvci1j
b21tYW5kJywgKip7J2NvbW1hbmQtbGluZSc6ICdpbmZvIG5ldHdvcmsnfSkKZXhwZWN0KGxhbWJk
YSByOiByID09IHsncmV0dXJuJzoge319KQpyZXBseSA9IGV4cGVjdChsYW1iZGEgcjogc2V0KHIu
a2V5cygpKSA9PSB7J3JldHVybid9KQojIEFuZCBub3cgd2UgaGF2ZSB0d28gbmV0MHM6CiMgdmly
dGlvLW5ldC1wY2kuMDogaW5kZXg9MCx0eXBlPW5pYyxtb2RlbD12aXJ0aW8tbmV0LXBjaSxtYWNh
ZGRyPS4uLgojICBcIG5ldDA6IGluZGV4PTAsdHlwZT11c2VyLG5ldD0xMC4wLjIuMCxyZXN0cmlj
dD1vbgojICBcIG5ldDA6IGluZGV4PTAsdHlwZT11c2VyLG5ldD0xMC4wLjIuMCxyZXN0cmljdD1v
ZmYKYXNzZXJ0KCdyZXN0cmljdD1vbicgaW4gcmVwbHlbJ3JldHVybiddKQphc3NlcnQoJ3Jlc3Ry
aWN0PW9mZicgaW4gcmVwbHlbJ3JldHVybiddKQoKCiMgY29ubmVjdCB0byBtb2RpZmllZAoKc29j
a190ZXN0ID0gc29ja2V0LnNvY2tldChzb2NrZXQuQUZfSU5FVCwgc29ja2V0LlNPQ0tfU1RSRUFN
KQp0aW1lLnNsZWVwKC4yKQpzb2NrX3Rlc3QuY29ubmVjdCgoJzEyNy4wLjAuMScsIFRFU1RfUE9S
VCkpCnNvY2tfdGVzdC5jbG9zZSgpCnByaW50KGYncG9ydCB7VEVTVF9QT1JUfSBhY2NlcHRpbmcg
Y29ubmVjdGlvbnMnKQo=
--0000000000003082b405d32f6b7e
Content-Type: text/x-log; charset="US-ASCII"; name="qemu-netdev.qemu5.log"
Content-Disposition: attachment; filename="qemu-netdev.qemu5.log"
Content-Transfer-Encoding: base64
Content-ID: <f_kx7k0roq1>
X-Attachment-Id: f_kx7k0roq1

UU1QIGNvbm5lY3RpbmcsIGF0dGVtcHQgMS8yClFNUCBjb25uZWN0ZWQuLi4KZXhlY3V0ZWQ6IHFt
cF9jYXBhYmlsaXRpZXMge30KcmVjZWl2ZWQ6IHsnUU1QJzogeyd2ZXJzaW9uJzogeydxZW11Jzog
eydtaWNybyc6IDAsICdtaW5vcic6IDIsICdtYWpvcic6IDV9LCAncGFja2FnZSc6ICdxZW11LTUu
Mi4wLTguZmMzNCd9LCAnY2FwYWJpbGl0aWVzJzogWydvb2InXX19CmV4ZWN1dGVkOiBodW1hbi1t
b25pdG9yLWNvbW1hbmQgeydjb21tYW5kLWxpbmUnOiAnaW5mbyBuZXR3b3JrJ30KcmVjZWl2ZWQ6
IHsncmV0dXJuJzoge319CnJlY2VpdmVkOiB7J3JldHVybic6ICd2aXJ0aW8tbmV0LXBjaS4wOiBp
bmRleD0wLHR5cGU9bmljLG1vZGVsPXZpcnRpby1uZXQtcGNpLG1hY2FkZHI9NTI6NTQ6MDA6MTI6
MzQ6NTZcclxuIFxcIG5ldDA6IGluZGV4PTAsdHlwZT11c2VyLG5ldD0xMC4wLjIuMCxyZXN0cmlj
dD1vblxyXG4nfQoKZXhlY3V0ZWQ6IG5ldGRldl9hZGQgeyd0eXBlJzogJ3VzZXInLCAnaWQnOiAn
bmV0MCcsICdyZXN0cmljdCc6IEZhbHNlLCAnaG9zdGZ3ZCc6IFt7J3N0cic6ICd0Y3A6MTI3LjAu
MC4xOjEyMzQ2LToxJ31dfQpleGVjdXRlZDogaHVtYW4tbW9uaXRvci1jb21tYW5kIHsnY29tbWFu
ZC1saW5lJzogJ2luZm8gbmV0d29yayd9CnJlY2VpdmVkOiB7J3JldHVybic6IHt9fQpyZWNlaXZl
ZDogeydyZXR1cm4nOiAndmlydGlvLW5ldC1wY2kuMDogaW5kZXg9MCx0eXBlPW5pYyxtb2RlbD12
aXJ0aW8tbmV0LXBjaSxtYWNhZGRyPTUyOjU0OjAwOjEyOjM0OjU2XHJcbiBcXCBuZXQwOiBpbmRl
eD0wLHR5cGU9dXNlcixuZXQ9MTAuMC4yLjAscmVzdHJpY3Q9b25cclxubmV0MDogaW5kZXg9MCx0
eXBlPXVzZXIsbmV0PTEwLjAuMi4wLHJlc3RyaWN0PW9mZlxyXG4nfQpwb3J0IDEyMzQ2IGFjY2Vw
dGluZyBjb25uZWN0aW9ucwo=
--0000000000003082b405d32f6b7e
Content-Type: text/x-log; charset="US-ASCII"; name="qemu-netdev.qemu6.log"
Content-Disposition: attachment; filename="qemu-netdev.qemu6.log"
Content-Transfer-Encoding: base64
Content-ID: <f_kx7k0ul82>
X-Attachment-Id: f_kx7k0ul82

UU1QIGNvbm5lY3RpbmcsIGF0dGVtcHQgMS8yClFNUCBjb25uZWN0ZWQuLi4KZXhlY3V0ZWQ6IHFt
cF9jYXBhYmlsaXRpZXMge30KcmVjZWl2ZWQ6IHsnUU1QJzogeyd2ZXJzaW9uJzogeydxZW11Jzog
eydtaWNybyc6IDAsICdtaW5vcic6IDEsICdtYWpvcic6IDZ9LCAncGFja2FnZSc6ICcnfSwgJ2Nh
cGFiaWxpdGllcyc6IFsnb29iJ119fQpleGVjdXRlZDogaHVtYW4tbW9uaXRvci1jb21tYW5kIHsn
Y29tbWFuZC1saW5lJzogJ2luZm8gbmV0d29yayd9CnJlY2VpdmVkOiB7J3JldHVybic6IHt9fQpy
ZWNlaXZlZDogeydyZXR1cm4nOiAndmlydGlvLW5ldC1wY2kuMDogaW5kZXg9MCx0eXBlPW5pYyxt
b2RlbD12aXJ0aW8tbmV0LXBjaSxtYWNhZGRyPTUyOjU0OjAwOjEyOjM0OjU2XHJcbiBcXCBuZXQw
OiBpbmRleD0wLHR5cGU9dXNlcixuZXQ9MTAuMC4yLjAscmVzdHJpY3Q9b25cclxuJ30KCmV4ZWN1
dGVkOiBuZXRkZXZfYWRkIHsndHlwZSc6ICd1c2VyJywgJ2lkJzogJ25ldDAnLCAncmVzdHJpY3Qn
OiBGYWxzZSwgJ2hvc3Rmd2QnOiBbeydzdHInOiAndGNwOjEyNy4wLjAuMToxMjM0Ni06MSd9XX0K
ZXhlY3V0ZWQ6IGh1bWFuLW1vbml0b3ItY29tbWFuZCB7J2NvbW1hbmQtbGluZSc6ICdpbmZvIG5l
dHdvcmsnfQpyZWNlaXZlZDogeydlcnJvcic6IHsnY2xhc3MnOiAnR2VuZXJpY0Vycm9yJywgJ2Rl
c2MnOiAiRHVwbGljYXRlIElEICduZXQwJyJ9fQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwg
bGFzdCk6CiAgRmlsZSAiL2hvbWUvYXNvc2Vka2kvcmVwcm9kdWNlcnMvcWVtdS1uZXRkZXYtcmVw
cm9kdWNlci5weSIsIGxpbmUgNzksIGluIDxtb2R1bGU+CiAgICBleHBlY3QobGFtYmRhIHI6IHIg
PT0geydyZXR1cm4nOiB7fX0pCiAgRmlsZSAiL2hvbWUvYXNvc2Vka2kvcmVwcm9kdWNlcnMvcWVt
dS1uZXRkZXYtcmVwcm9kdWNlci5weSIsIGxpbmUgNDgsIGluIGV4cGVjdAogICAgYXNzZXJ0IHZh
bGlkYXRvcl9mdW5jKHJlcGx5KQpBc3NlcnRpb25FcnJvcgo=
--0000000000003082b405d32f6b7e
Content-Type: text/x-log; charset="US-ASCII"; name="qemu-netdev.qemu6-nocheck.log"
Content-Disposition: attachment; filename="qemu-netdev.qemu6-nocheck.log"
Content-Transfer-Encoding: base64
Content-ID: <f_kx7ktguq3>
X-Attachment-Id: f_kx7ktguq3

UU1QIGNvbm5lY3RpbmcsIGF0dGVtcHQgMS8yClFNUCBjb25uZWN0ZWQuLi4KZXhlY3V0ZWQ6IHFt
cF9jYXBhYmlsaXRpZXMge30KcmVjZWl2ZWQ6IHsnUU1QJzogeyd2ZXJzaW9uJzogeydxZW11Jzog
eydtaWNybyc6IDAsICdtaW5vcic6IDEsICdtYWpvcic6IDZ9LCAncGFja2FnZSc6ICcnfSwgJ2Nh
cGFiaWxpdGllcyc6IFsnb29iJ119fQpleGVjdXRlZDogaHVtYW4tbW9uaXRvci1jb21tYW5kIHsn
Y29tbWFuZC1saW5lJzogJ2luZm8gbmV0d29yayd9CnJlY2VpdmVkOiB7J3JldHVybic6IHt9fQpy
ZWNlaXZlZDogeydyZXR1cm4nOiAndmlydGlvLW5ldC1wY2kuMDogaW5kZXg9MCx0eXBlPW5pYyxt
b2RlbD12aXJ0aW8tbmV0LXBjaSxtYWNhZGRyPTUyOjU0OjAwOjEyOjM0OjU2XHJcbiBcXCBuZXQw
OiBpbmRleD0wLHR5cGU9dXNlcixuZXQ9MTAuMC4yLjAscmVzdHJpY3Q9b25cclxuJ30KCmV4ZWN1
dGVkOiBuZXRkZXZfYWRkIHsndHlwZSc6ICd1c2VyJywgJ2lkJzogJ25ldDAnLCAncmVzdHJpY3Qn
OiBGYWxzZSwgJ2hvc3Rmd2QnOiBbeydzdHInOiAndGNwOjEyNy4wLjAuMToxMjM0Ni06MSd9XX0K
ZXhlY3V0ZWQ6IGh1bWFuLW1vbml0b3ItY29tbWFuZCB7J2NvbW1hbmQtbGluZSc6ICdpbmZvIG5l
dHdvcmsnfQpyZWNlaXZlZDogeydyZXR1cm4nOiB7fX0KcmVjZWl2ZWQ6IHsncmV0dXJuJzogJ3Zp
cnRpby1uZXQtcGNpLjA6IGluZGV4PTAsdHlwZT1uaWMsbW9kZWw9dmlydGlvLW5ldC1wY2ksbWFj
YWRkcj01Mjo1NDowMDoxMjozNDo1NlxyXG4gXFwgbmV0MDogaW5kZXg9MCx0eXBlPXVzZXIsbmV0
PTEwLjAuMi4wLHJlc3RyaWN0PW9uXHJcbm5ldDA6IGluZGV4PTAsdHlwZT11c2VyLG5ldD0xMC4w
LjIuMCxyZXN0cmljdD1vZmZcclxuJ30KcG9ydCAxMjM0NiBhY2NlcHRpbmcgY29ubmVjdGlvbnMK

--0000000000003082b405d32f6b7e--


