Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78D2D7725
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:57:21 +0100 (CET)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knivA-0004fS-6j
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonwxqian@gmail.com>)
 id 1kndrT-0001bl-Cl
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:33:11 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:43091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leonwxqian@gmail.com>)
 id 1kndrO-0002am-Pp
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:33:10 -0500
Received: by mail-lj1-x22d.google.com with SMTP id e7so9919267ljg.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 00:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qpkb6IxmwJxPSLsK1LI1GSSKB24NhtN5FsaBq6swSCw=;
 b=FlzDOzPZIX7YKHoqGfGIChxUkmJI+BB8nH/uWRMNITf4Kcog3F4GMp4DlKmMrSfeJu
 TZFoFrrM+idBCnoOHFXfUBAfLE/FVYBufD2TqxTx8MooBEREqyqcQhHp3mYNLmue1Ies
 I6LWQZwKy1dp77jJ2l7ncMZMTp1ElLPCk70F7+pufM+WnKjCLF4v1NlC8mcafBxvFvf5
 F5AY181xp1e6I89vDQi8fOAVQBg2J411/Ti5lvwyF3aHYros1CUTKGwnOE+h4RbQXYp1
 e4oZk8Ytt2lnsSt6LmVNYKwdPn0v0BGeAyBVm0TR8KbrRsEPnxXY2ma5z/laZIUcck1d
 dAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qpkb6IxmwJxPSLsK1LI1GSSKB24NhtN5FsaBq6swSCw=;
 b=QRGoRZExjFjDrSnRxF0W/Xc80RD5PwJl3DwCzDvEDfZoyTPGLLESnq+6wY6vyNzpLX
 xICf04h5lig93B5DW+4TD7TkywItmSTCIb9BTDdDLhYWcLy8QbCgmdATwCSkrJAZRxi+
 w7EJATE2Ve5XH2GwNpyMsNcXqQlNTQ5cbNvlwSct7AAZ8YYIssMFSF05rBe6/atRQuS3
 5M6wY92Ejq407evIE0Ft++qL5rWSLV5ighQ8fyoA1AyQ9gejjlx3D7/7yh3g9zjE8YO7
 ybeKltLXxhrSsDzcdCBcyhm64uvBGTnuAd6yRNq+tDnsQqod70GhI8hILdSQKHXpnMkH
 SCAw==
X-Gm-Message-State: AOAM5325xmNk4+YmrheRvZEfQV14lbbC2tu3zohTsgnk2bE+dvSqjtlB
 9MZQGDt4SnrIxLRNdmxuBgGc9Zv1HcuRMViPtpM=
X-Google-Smtp-Source: ABdhPJzyJyos2YckguG8afAZyfqq64QACVjYDv2gsPa5SyM8jTh/dmTfN76La7TkdBcNSvQEyWnKfOR9N95LB7HBXWc=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr5101512lji.276.1607675584816; 
 Fri, 11 Dec 2020 00:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
 <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
 <CAKZf9JDg=5y=2v=O6ZQjcLCYXXEn2szM_c3rrQgtTHvLsSicww@mail.gmail.com>
In-Reply-To: <CAKZf9JDg=5y=2v=O6ZQjcLCYXXEn2szM_c3rrQgtTHvLsSicww@mail.gmail.com>
From: Wenxiang Qian <leonwxqian@gmail.com>
Date: Fri, 11 Dec 2020 16:32:53 +0800
Message-ID: <CAKZf9JCJ6A1XjKVWigXTTT-2Jbcshyct3b9pL+PdOtLHizCFvw@mail.gmail.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: P J P <ppandit@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000025aa1f05b62c246b"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=leonwxqian@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:55:43 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000025aa1f05b62c246b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ The lba is set to -1 to avoid some code paths, to make PoC simpler.

void ide_atapi_cmd_reply_end(IDEState *s)
{
    int byte_count_limit, size, ret;
    while (s->packet_transfer_size > 0) {
.....
        if (s->lba !=3D -1 && s->io_buffer_index >=3D s->cd_sector_size) {
<----- set lba to -1 to avoid this part
 .....
        }
        if (s->elementary_transfer_size > 0) {
......
        } else {
.......
            if (s->lba !=3D -1) {   <-----
                if (size > (s->cd_sector_size - s->io_buffer_index))
                    size =3D (s->cd_sector_size - s->io_buffer_index);  <--=
---
            }
        }

Wenxiang Qian <leonwxqian@gmail.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=8811=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=884:23=E5=86=99=E9=81=93=EF=BC=9A

> Hello,
>
> I may not have made the detail clear in my previous email. The details of
> the AHCI device, after running the reproducer I attached in my report are
> as follows. If there is any information I can provide, please let me know=
.
> Thank you.
>
> ###root cause###
> (1) The s->packet_transfer_size is bigger than the actual data.
> (2) packet_transfer_size is passed into  ide_atapi_cmd_reply_end, as the
> total number of iterations. Each iterate round, s->io_buffer_index is
> increased by 2048, but without boundary check.
> (3) The call to ide_transfer_start_norecurse use s->io_buffer +
> s->io_buffer_index - size as the index, cause an OOB access.
>
> ###details###
> 1. The reproducer sends a command of [WIN_PACKETCMD] + [CMD_READ] and
> value of IDE device's registers from guest to qemu.
>
> Callback ahci_port_write is called, then check_cmd is called.
>
> 2. The packet will set all the registers of the device via: handle_cmd --=
>
> handle_reg_h2d_fis.
>
> Registers will be set here:
>
> handle_reg_h2d_fis(..){
> ...
>     ide_state->feature =3D cmd_fis[3];   //######[1]###### , cmd_fis is t=
he
> data sent by the reproducer.
>     ide_state->sector =3D cmd_fis[4];      /* LBA 7:0 */
>     ide_state->lcyl =3D cmd_fis[5];        /* LBA 15:8  */
>     ide_state->hcyl =3D cmd_fis[6];        /* LBA 23:16 */
>     ide_state->select =3D cmd_fis[7];      /* LBA 27:24 (LBA28) */
>     ide_state->hob_sector =3D cmd_fis[8];  /* LBA 31:24 */
>     ide_state->hob_lcyl =3D cmd_fis[9];    /* LBA 39:32 */
>     ide_state->hob_hcyl =3D cmd_fis[10];   /* LBA 47:40 */
>     ide_state->hob_feature =3D cmd_fis[11];
>     ide_state->nsector =3D (int64_t)((cmd_fis[13] << 8) | cmd_fis[12]);
>
>  and ide_exec_cmd will be called to process [WIN_PACKETCMD] command.
>      ide_exec_cmd(&s->dev[port].port, cmd_fis[2]);
>
> 3. ide_exec_cmd (core.c) handles the command,
>
>     [WIN_PACKETCMD]               =3D { cmd_packet, CD_OK },
>
> and make a call to cmd_packet,
>
> cmd_packet(...) {
>     ...
>
> s->atapi_dma =3D s->feature & 1;  //######[2]######
>     if (s->atapi_dma) {
>         s->dma_cmd =3D IDE_DMA_ATAPI;
>     }
>     s->nsector =3D 1;
>     ide_transfer_start(s, s->io_buffer, ATAPI_PACKET_SIZE,
>                        ide_atapi_cmd);
>     ...
> }
>
> and set the device to use PIO mode according to s->feature (set in Step
> 2->##[1]##).
>
> Then, ide_transfer_start is called.
> It will pass the [CMD_READ] part after [WIN_PACKETCMD] to ide_atapi_cmd.
>
> 4. ide_atapi_cmd parses [CMD_READ], and then calls the corresponding
> handler: cmd_read.
>
>     [ 0x28 ] =3D { cmd_read, /* (10) */               CHECK_READY },
>
> In cmd_read, the values of nb_sectors and lba are determined according to
> the packets passed by the reproducer.
>
> In my PoC I set lba to -1 (0xfffffff) and nb_sectors to a large value,
> such as 0x800.
>
>
> static void cmd_read(IDEState *s, uint8_t* buf)
> {
>     int nb_sectors, lba;
>
>     if (buf[0] =3D=3D GPCMD_READ_10) {
>         nb_sectors =3D lduw_be_p(buf + 7);
>     } else {
>         nb_sectors =3D ldl_be_p(buf + 6);   //#####3#####
>     }
>
>     lba =3D ldl_be_p(buf + 2);   //######4######
>
> ....
>
>     ide_atapi_cmd_read(s, lba, nb_sectors, 2048);
> }
>
> 5. The code enters the ide_atapi_cmd_read -> ide_atapi_cmd_read_pio.
>
> static void ide_atapi_cmd_read(.....)
> {...
>     if (s->atapi_dma) {
>         ide_atapi_cmd_read_dma(s, lba, nb_sectors, sector_size);
>     } else {
>         ide_atapi_cmd_read_pio(s, lba, nb_sectors, sector_size);
>  //######5#######
>     }
> }
>
> It will set the attributes according to the value passed in the previous
> steps.
> The number of s->packet_transfer_size, which is the packet to read or
> write, nb_sectors * 2048 can be larger than the buffer pre-allocated by
> qemu (about 256KB).
>
>
> static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
>                                    int sector_size)
> {
>     s->lba =3D lba;
>     s->packet_transfer_size =3D nb_sectors * sector_size;
>  //########6#########
>     s->elementary_transfer_size =3D 0;
>     s->io_buffer_index =3D sector_size;
>     s->cd_sector_size =3D sector_size;
>
>     ide_atapi_cmd_reply_end(s);
> }
>
>
> 6. In ide_atapi_cmd_reply_end, the data is processed according to
> packet_transfer_size.
>
> void ide_atapi_cmd_reply_end(IDEState *s)
> {
> ...
>     while (s->packet_transfer_size > 0) {  //########7#######
> ....
>         s->packet_transfer_size -=3D size;
>         s->elementary_transfer_size -=3D size;
>         s->io_buffer_index +=3D size;  //#######8#######
>
>         if (!ide_transfer_start_norecurse(s,
>                                           s->io_buffer +
> s->io_buffer_index - size,
>                                           size, ide_atapi_cmd_reply_end))=
 {
>             return;
>         }
>
>
> The "size" is usually 2048, which means the io_buffer_index increases by
> 2048 per round.
>
> Qemu does not test if the result of this operation exceeds the length of
> the io_buffer itself, resulting in out-of-bounds access.
>
> In ide_transfer_start_norecurse,
>
> bool ide_transfer_start_norecurse(IDEState *s, uint8_t *buf, int size,
>                                   EndTransferFunc *end_transfer_func)
> {
>     s->data_ptr =3D buf;         //s->io_buffer + s->io_buffer_index - si=
ze
>     s->data_end =3D buf + size;  //data_ptr + 2048
> ....
>     s->bus->dma->ops->pio_transfer(s->bus->dma);  //#######9########
>     return true;
> }
>
> //####9####:
> static const IDEDMAOps ahci_dma_ops =3D {
> ...
>     .pio_transfer =3D ahci_pio_transfer,
> ...
> };
>
> In the final processing function ahci_pio_transfer:
>
> static void ahci_pio_transfer(const IDEDMA *dma)
> {
> ....
>
>     uint32_t size =3D (uint32_t)(s->data_end - s->data_ptr);  // 2048,
> usually
>
> uint16_t opts =3D le16_to_cpu(ad->cur_cmd->opts);  //####user controlled
> value#####
>     int is_write =3D opts & AHCI_CMD_WRITE;            // read or write i=
s
> decided by user.
>
> .....
>
>
>     if (has_sglist && size) {
>         if (is_write) {
>             dma_buf_write(s->data_ptr, size, &s->sg);   //##10##### both
> can be reached ####
>         } else {
>             dma_buf_read(s->data_ptr, size, &s->sg);    //##11##### both
> can be reached ####
>         }
>     }
> }
>
>
> s->data_ptr can be a value out of range, so base on ad->cur_cmd->opts,
>  ##10## ##11## can be OOB read or OOB write.
>
> OOB read: obtain the leaked information, which can be used to bypass ASLR
> or obtain information about the host.
> OOB write: which may overwrite some structs of the virtual device after
> it, overwrite the function pointers in the struct.
>
> Best regards,
> Wenxiang Qian
>
> P J P <ppandit@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=882=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=889:17=E5=86=99=E9=81=93=EF=BC=9A
>
>>   Hi,
>>
>> [doing a combined reply]
>>
>> +-- On Tue, 1 Dec 2020, Philippe Mathieu-Daud=C3=83=C2=A9 wrote --+
>> | Is it possible to release the reproducer to the community, so we can
>> work on
>> | a fix and test it?
>>
>> * No, we can not release/share reproducers on a public list.
>>
>> * We can request reporters to do so by their volition.
>>
>>
>> | What happens to reproducers when a CVE is assigned, but the bug is
>> marked as
>> | "out of the QEMU security boundary"?
>> |
>> +-- On Tue, 1 Dec 2020, Peter Maydell wrote --+
>> | Also, why are we assigning CVEs for bugs we don't consider security
>> bugs?
>>
>> * We need to mark these componets 'out of security scope' at the source
>> level,
>>   rather than on each bug.
>>
>> * Easiest could be to just have a list of such components in the git tex=
t
>>   file. At least till the time we device --security build and run time
>> option
>>   discussed earlier.
>>   ->
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg04680.html
>>
>> +-- On Tue, 1 Dec 2020, Paolo Bonzini wrote --+
>> | qtests are not just helpful.  Adding regression tests for bugs is a
>> *basic*
>> | software engineering principle.  If you don't have time to write tests=
,
>> you
>> | (or your organization) should find it.
>>
>> * I've been doing the patch work out of my own interest.
>>
>> * We generally rely on upstream/engineering for fix patches, because of
>> our
>>   narrower understanding of the code base.
>>
>> +-- On Wed, 2 Dec 2020, Markus Armbruster wrote --+
>> | Paolo Bonzini <pbonzini@redhat.com> writes:
>> | > you need at least to enclose the reproducer, otherwise you're postin=
g
>> a
>> | > puzzle not a patch. :)
>> |
>> | Indeed. Posting puzzles is a negative-sum game.]
>>
>> * Agreed. I think the upcoming 'qemu-security' list may help in this
>> regard.
>>   As issue reports+reproducer details shall go there.
>>
>> * Even then, we'll need to ask reporter's permission before sharing thei=
r
>>   reproducers on a public list OR with non-members.
>>
>> * Best is if reporters share/release reproducers themselves. Maybe we ca=
n
>> have
>>   a public git repository and they can send a PR to include their
>> reproducers
>>   in the repository.
>>
>> * That way multiple reproducers for the same issue can be held together.
>>
>>
>> Thank you.
>> --
>> Prasad J Pandit / Red Hat Product Security Team
>> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
>
>

--00000000000025aa1f05b62c246b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ The lba is set to -1 to avoid some code=20

paths, to make PoC simpler.<div><br><div>void ide_atapi_cmd_reply_end(IDESt=
ate *s)<br>{<br>=C2=A0 =C2=A0 int byte_count_limit, size, ret;<br>=C2=A0 =
=C2=A0 while (s-&gt;packet_transfer_size &gt; 0) {</div><div>.....<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;lba !=3D -1 &amp;&amp; s-&gt;io_buffer_i=
ndex &gt;=3D s-&gt;cd_sector_size) {=C2=A0=C2=A0

&lt;----- set lba to -1 to avoid this part<br>=C2=A0.....<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;elementary_transfe=
r_size &gt; 0) {</div><div>......<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<b=
r>.......<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;lba !=3D -=
1) {=C2=A0=C2=A0

&lt;-----

<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &gt; (=
s-&gt;cd_sector_size - s-&gt;io_buffer_index))<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D (s-&gt;cd_sector_siz=
e - s-&gt;io_buffer_index);=C2=A0 &lt;-----<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></div></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Wenxiang Qi=
an &lt;<a href=3D"mailto:leonwxqian@gmail.com">leonwxqian@gmail.com</a>&gt;=
 =E4=BA=8E2020=E5=B9=B412=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=
=E5=8D=884:23=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Hello,<div><br></div><div>I may n=
ot have made the detail clear in my previous email. The details of the AHCI=
 device, after running the reproducer I attached in my report are as follow=
s. If there is any information I can provide, please let me know. Thank you=
.</div><div><br></div><div>###root cause###</div><div>(1) The s-&gt;packet_=
transfer_size is bigger than the actual data.<br></div><div>(2) packet_tran=
sfer_size is passed into=C2=A0 ide_atapi_cmd_reply_end, as the total number=
 of iterations. Each iterate round,=C2=A0s-&gt;io_buffer_index is increased=
 by 2048, but without boundary check.</div><div>(3) The call to ide_transfe=
r_start_norecurse use s-&gt;io_buffer + s-&gt;io_buffer_index - size as the=
 index, cause an OOB access.</div><div><br></div><div>###details###</div><d=
iv>1. The reproducer sends a command of [WIN_PACKETCMD] + [CMD_READ] and va=
lue of IDE device&#39;s registers from guest to qemu.=C2=A0</div><div><br><=
/div><div>Callback ahci_port_write is called, then check_cmd is called.</di=
v><div><br>2. The packet will set all the registers of the device via: hand=
le_cmd --&gt; handle_reg_h2d_fis.<br><br>Registers will be set here:<br><br=
>handle_reg_h2d_fis(..){<br>...<br>=C2=A0 =C2=A0 ide_state-&gt;feature =3D =
cmd_fis[3]; =C2=A0 //######[1]###### , cmd_fis is the data sent by the repr=
oducer.<br>=C2=A0 =C2=A0 ide_state-&gt;sector =3D cmd_fis[4]; =C2=A0 =C2=A0=
 =C2=A0/* LBA 7:0 */<br>=C2=A0 =C2=A0 ide_state-&gt;lcyl =3D cmd_fis[5]; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* LBA 15:8 =C2=A0*/<br>=C2=A0 =C2=A0 ide_state-=
&gt;hcyl =3D cmd_fis[6]; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LBA 23:16 */<br>=C2=
=A0 =C2=A0 ide_state-&gt;select =3D cmd_fis[7]; =C2=A0 =C2=A0 =C2=A0/* LBA =
27:24 (LBA28) */<br>=C2=A0 =C2=A0 ide_state-&gt;hob_sector =3D cmd_fis[8]; =
=C2=A0/* LBA 31:24 */<br>=C2=A0 =C2=A0 ide_state-&gt;hob_lcyl =3D cmd_fis[9=
]; =C2=A0 =C2=A0/* LBA 39:32 */<br>=C2=A0 =C2=A0 ide_state-&gt;hob_hcyl =3D=
 cmd_fis[10]; =C2=A0 /* LBA 47:40 */<br>=C2=A0 =C2=A0 ide_state-&gt;hob_fea=
ture =3D cmd_fis[11];<br>=C2=A0 =C2=A0 ide_state-&gt;nsector =3D (int64_t)(=
(cmd_fis[13] &lt;&lt; 8) | cmd_fis[12]);<br><br>=C2=A0and ide_exec_cmd will=
 be called to process [WIN_PACKETCMD] command. <br>=C2=A0 =C2=A0 =C2=A0ide_=
exec_cmd(&amp;s-&gt;dev[port].port, cmd_fis[2]);<br>	 <br>3. ide_exec_cmd (=
core.c) handles the command, <br><br>=C2=A0 =C2=A0 [WIN_PACKETCMD] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { cmd_packet, CD_OK },<br>	<b=
r>and make a call to cmd_packet, <br><br>cmd_packet(...) {<br>=C2=A0 =C2=A0=
 ...<br>	<br>	s-&gt;atapi_dma =3D s-&gt;feature &amp; 1; =C2=A0//######[2]#=
#####<br>=C2=A0 =C2=A0 if (s-&gt;atapi_dma) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s-&gt;dma_cmd =3D IDE_DMA_ATAPI;<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 s-=
&gt;nsector =3D 1;<br>=C2=A0 =C2=A0 ide_transfer_start(s, s-&gt;io_buffer, =
ATAPI_PACKET_SIZE,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_atapi_cmd);<br>=C2=A0 =C2=A0 ...<br>}<br=
><br>and set the device to use PIO mode according to s-&gt;feature (set in =
Step 2-&gt;##[1]##). <br><br>Then, ide_transfer_start is called. <br>It wil=
l pass the [CMD_READ] part after [WIN_PACKETCMD] to ide_atapi_cmd. <br>	<br=
>4. ide_atapi_cmd parses [CMD_READ], and then calls the corresponding handl=
er: cmd_read. <br><br>=C2=A0 =C2=A0 [ 0x28 ] =3D { cmd_read, /* (10) */ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_READY },<br>	<br>In cmd=
_read, the values of nb_sectors and lba are determined according to the pac=
kets passed by the reproducer. <br><br>In my PoC I set lba to -1 (0xfffffff=
) and nb_sectors to a large value, such as 0x800. <br><br><br>static void c=
md_read(IDEState *s, uint8_t* buf)<br>{<br>=C2=A0 =C2=A0 int nb_sectors, lb=
a;<br><br>=C2=A0 =C2=A0 if (buf[0] =3D=3D GPCMD_READ_10) {<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 nb_sectors =3D lduw_be_p(buf + 7);<br>=C2=A0 =C2=A0 } else {=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 nb_sectors =3D ldl_be_p(buf + 6); =C2=A0 //=
#####3#####<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 lba =3D ldl_be_p(buf + =
2); =C2=A0 //######4######<br><br>	....<br>	<br>=C2=A0 =C2=A0 ide_atapi_cmd=
_read(s, lba, nb_sectors, 2048);<br>}<br><br>5. The code enters the ide_ata=
pi_cmd_read -&gt; ide_atapi_cmd_read_pio.<br><br>static void ide_atapi_cmd_=
read(.....)<br>{...<br>=C2=A0 =C2=A0 if (s-&gt;atapi_dma) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ide_atapi_cmd_read_dma(s, lba, nb_sectors, sector_size);<=
br>=C2=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_atapi_cmd_read=
_pio(s, lba, nb_sectors, sector_size); =C2=A0//######5#######<br>=C2=A0 =C2=
=A0 }<br>}<br><br>It will set the attributes according to the value passed =
in the previous steps. <br>The number of s-&gt;packet_transfer_size, which =
is the packet to read or write, nb_sectors * 2048 can be larger than the bu=
ffer pre-allocated by qemu (about 256KB). <br><br><br>static void ide_atapi=
_cmd_read_pio(IDEState *s, int lba, int nb_sectors,<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sector_size)<br>{<br>=C2=A0 =C2=A0 s-&gt=
;lba =3D lba;<br>=C2=A0 =C2=A0 s-&gt;packet_transfer_size =3D nb_sectors * =
sector_size; =C2=A0//########6#########<br>=C2=A0 =C2=A0 s-&gt;elementary_t=
ransfer_size =3D 0;<br>=C2=A0 =C2=A0 s-&gt;io_buffer_index =3D sector_size;=
<br>=C2=A0 =C2=A0 s-&gt;cd_sector_size =3D sector_size;<br><br>=C2=A0 =C2=
=A0 ide_atapi_cmd_reply_end(s);<br>}<br><br><br>6. In ide_atapi_cmd_reply_e=
nd, the data is processed according to packet_transfer_size. <br><br>void i=
de_atapi_cmd_reply_end(IDEState *s)<br>{<br>...<br>=C2=A0 =C2=A0 while (s-&=
gt;packet_transfer_size &gt; 0) { =C2=A0//########7#######<br>....<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;packet_transfer_size -=3D size;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 s-&gt;elementary_transfer_size -=3D size;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 s-&gt;io_buffer_index +=3D size; =C2=A0//#######8#####=
##<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ide_transfer_start_norecurse(s,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s-&gt;io_buffer + s-&gt;io_buffer_index - size, =C2=A0<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size, ide_atapi=
_cmd_reply_end)) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br><br>The &quot;size&quot; is usually 20=
48, which means the io_buffer_index increases by 2048 per round.<br><br>Qem=
u does not test if the result of this operation exceeds the length of the i=
o_buffer itself, resulting in out-of-bounds access. <br><br>In ide_transfer=
_start_norecurse,<br><br>bool ide_transfer_start_norecurse(IDEState *s, uin=
t8_t *buf, int size,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EndTr=
ansferFunc *end_transfer_func)<br>{<br>=C2=A0 =C2=A0 s-&gt;data_ptr =3D buf=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 //s-&gt;io_buffer + s-&gt;io_buffer_index - s=
ize <br>=C2=A0 =C2=A0 s-&gt;data_end =3D buf + size; =C2=A0//data_ptr + 204=
8<br>....<br>=C2=A0 =C2=A0 s-&gt;bus-&gt;dma-&gt;ops-&gt;pio_transfer(s-&gt=
;bus-&gt;dma); =C2=A0//#######9########<br>=C2=A0 =C2=A0 return true;<br>}<=
br><br>//####9####:<br>static const IDEDMAOps ahci_dma_ops =3D {<br>...<br>=
=C2=A0 =C2=A0 .pio_transfer =3D ahci_pio_transfer,<br>...<br>};<br><br>In t=
he final processing function ahci_pio_transfer:<br><br>static void ahci_pio=
_transfer(const IDEDMA *dma)<br>{<br>....<br><br>=C2=A0 =C2=A0 uint32_t siz=
e =3D (uint32_t)(s-&gt;data_end - s-&gt;data_ptr); =C2=A0// 2048, usually<b=
r>	<br>	uint16_t opts =3D le16_to_cpu(ad-&gt;cur_cmd-&gt;opts); =C2=A0//###=
#user controlled value#####<br>=C2=A0 =C2=A0 int is_write =3D opts &amp; AH=
CI_CMD_WRITE; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// read or write is =
decided by user.<br>	<br>.....<br><br><br>=C2=A0 =C2=A0 if (has_sglist &amp=
;&amp; size) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_write) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_write(s-&gt;data_ptr, size, &amp;s-=
&gt;sg); =C2=A0 //##10##### both can be reached ####<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_re=
ad(s-&gt;data_ptr, size, &amp;s-&gt;sg); =C2=A0 =C2=A0//##11##### both can =
be reached ####<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 }<br>}<br=
><br><br>s-&gt;data_ptr can be a value out of range, so base on ad-&gt;cur_=
cmd-&gt;opts, =C2=A0##10## ##11## can be OOB read or OOB write.<br><br>OOB =
read: obtain the leaked information, which can be used to bypass ASLR or ob=
tain information about the host.<br>OOB write: which may overwrite some str=
ucts of the virtual device after it, overwrite the function pointers in the=
 struct.<br></div><div><br></div><div>Best regards,</div><div>Wenxiang Qian=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">P J P &lt;<a href=3D"mailto:ppandit@redhat.com" target=3D"_blank">ppa=
ndit@redhat.com</a>&gt; =E4=BA=8E2020=E5=B9=B412=E6=9C=882=E6=97=A5=E5=91=
=A8=E4=B8=89 =E4=B8=8B=E5=8D=889:17=E5=86=99=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi,<br>
<br>
[doing a combined reply]<br>
<br>
+-- On Tue, 1 Dec 2020, Philippe Mathieu-Daud=C3=83=C2=A9 wrote --+ <br>
| Is it possible to release the reproducer to the community, so we can work=
 on <br>
| a fix and test it?<br>
<br>
* No, we can not release/share reproducers on a public list.<br>
<br>
* We can request reporters to do so by their volition.<br>
<br>
<br>
| What happens to reproducers when a CVE is assigned, but the bug is marked=
 as <br>
| &quot;out of the QEMU security boundary&quot;?<br>
|<br>
+-- On Tue, 1 Dec 2020, Peter Maydell wrote --+<br>
| Also, why are we assigning CVEs for bugs we don&#39;t consider security b=
ugs?<br>
<br>
* We need to mark these componets &#39;out of security scope&#39; at the so=
urce level, <br>
=C2=A0 rather than on each bug.<br>
<br>
* Easiest could be to just have a list of such components in the git text <=
br>
=C2=A0 file. At least till the time we device --security build and run time=
 option <br>
=C2=A0 discussed earlier.<br>
=C2=A0 -&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/20=
20-07/msg04680.html" rel=3D"noreferrer" target=3D"_blank">https://lists.non=
gnu.org/archive/html/qemu-devel/2020-07/msg04680.html</a><br>
<br>
+-- On Tue, 1 Dec 2020, Paolo Bonzini wrote --+<br>
| qtests are not just helpful.=C2=A0 Adding regression tests for bugs is a =
*basic* <br>
| software engineering principle.=C2=A0 If you don&#39;t have time to write=
 tests, you <br>
| (or your organization) should find it.<br>
<br>
* I&#39;ve been doing the patch work out of my own interest.<br>
<br>
* We generally rely on upstream/engineering for fix patches, because of our=
 <br>
=C2=A0 narrower understanding of the code base.<br>
<br>
+-- On Wed, 2 Dec 2020, Markus Armbruster wrote --+<br>
| Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank=
">pbonzini@redhat.com</a>&gt; writes:<br>
| &gt; you need at least to enclose the reproducer, otherwise you&#39;re po=
sting a <br>
| &gt; puzzle not a patch. :)<br>
| <br>
| Indeed. Posting puzzles is a negative-sum game.]<br>
<br>
* Agreed. I think the upcoming &#39;qemu-security&#39; list may help in thi=
s regard.=C2=A0 <br>
=C2=A0 As issue reports+reproducer details shall go there.<br>
<br>
* Even then, we&#39;ll need to ask reporter&#39;s permission before sharing=
 their <br>
=C2=A0 reproducers on a public list OR with non-members.<br>
<br>
* Best is if reporters share/release reproducers themselves. Maybe we can h=
ave <br>
=C2=A0 a public git repository and they can send a PR to include their repr=
oducers <br>
=C2=A0 in the repository.<br>
<br>
* That way multiple reproducers for the same issue can be held together.<br=
>
<br>
<br>
Thank you.<br>
--<br>
Prasad J Pandit / Red Hat Product Security Team<br>
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D</blockquote></div>
</blockquote></div>

--00000000000025aa1f05b62c246b--

