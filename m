Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F55BF684
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 08:41:46 +0200 (CEST)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oatQX-0003d8-41
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 02:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1oatC1-00043u-LY; Wed, 21 Sep 2022 02:26:47 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:52979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenh@yusur.tech>)
 id 1oatBv-00038b-Vo; Wed, 21 Sep 2022 02:26:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436334|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00879649-0.000748136-0.990455;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=chenh@yusur.tech; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.PKk-2mf_1663741587; 
Received: from 192.168.10.130(mailfrom:chenh@yusur.tech
 fp:SMTPD_---.PKk-2mf_1663741587) by smtp.aliyun-inc.com;
 Wed, 21 Sep 2022 14:26:28 +0800
Content-Type: multipart/alternative;
 boundary="------------frsk7wFSv6ax0upyqPZuM3Ej"
Message-ID: <b5886de1-1fff-5b64-0e38-541009af5d9c@yusur.tech>
Date: Wed, 21 Sep 2022 14:26:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jason Wang <jasowang@redhat.com>
Cc: mst <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, "houyl@yusur.tech" <houyl@yusur.tech>,
 "zy@yusur.tech" <zy@yusur.tech>, Cindy Lu <lulu@redhat.com>
References: <20220913090817.212224-1-chenh@yusur.tech>
 <CACGkMEs4nq_J4xXYUH54JMXETELC_i=WDR9UXByWCw6v1xLF4A@mail.gmail.com>
 <BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9@BL3PR02MB7938.namprd02.prod.outlook.com>
From: =?UTF-8?B?6ZmI5rWp?= <chenh@yusur.tech>
In-Reply-To: <BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9@BL3PR02MB7938.namprd02.prod.outlook.com>
Received-SPF: pass client-ip=115.124.28.149; envelope-from=chenh@yusur.tech;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------frsk7wFSv6ax0upyqPZuM3Ej
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/9/21 13:28, Raphael Norwitz 写道:
>
> I have some concerns from the vhost-user-blk side.
>
> >On Tue, Sep 13, 2022 at 5:13 PM Hao Chen <chenh@yusur.tech> wrote:
>
> >>
>
> >> When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
>
> >> start the virtual machine through libvirt or qemu, but now, the libvirt or
>
> >> qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
>
> >> to get the mac address of the vdpa hardware without manual configuration.
>
> >>
>
> >> Signed-off-by: Hao Chen <chenh@yusur.tech>
>
> >
>
> >Adding Cindy for comments.
>
> >
>
> >Thanks
>
> >
>
> >> ---
>
> >>hw/block/vhost-user-blk.c |1 -
>
> >>hw/net/virtio-net.c |3 ++-
>
> >>hw/virtio/vhost-user.c| 19 -------------------
>
> >>3 files changed, 2 insertions(+), 21 deletions(-)
>
> >>
>
> >> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>
> >> index 9117222456..5dca4eab09 100644
>
> >> --- a/hw/block/vhost-user-blk.c
>
> >> +++ b/hw/block/vhost-user-blk.c
>
> >> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
>
> >>
>
> >>vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>
> >>
>
> >> -s->vhost_user.supports_config = true;
>
> vhost-user-blk requires the backend to support 
> VHOST_USER_PROTOCOL_F_CONFIG
>
> and vhost_user.supports_config is used to enforce that.
>
> Why are you removing it here?
>
> >>ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
>
> >> errp);
>
> >>if (ret < 0) {
>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>
> >> index dd0d056fde..274ea84644 100644
>
> >> --- a/hw/net/virtio-net.c
>
> >> +++ b/hw/net/virtio-net.c
>
> >> @@ -149,7 +149,8 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>
> >> * Is this VDPA? No peer means not VDPA: there's no way to
>
> >> * disconnect/reconnect a VDPA peer.
>
> >> */
>
> >> -if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
>
> >> +if ((nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) ||
>
> >> +(nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER)) {
>
> >>ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>
> >> n->config_size);
>
> >>if (ret != -1) {
>
> >> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>
> >> index bd24741be8..8b01078249 100644
>
> >> --- a/hw/virtio/vhost-user.c
>
> >> +++ b/hw/virtio/vhost-user.c
>
> >> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>
> >>}
>
> >>
>
> Why are you removing this? Can you expand on how it helps dpdk-vdpa.
>
I implemented a function by modifying these places in the patch, and 
then implementing vhost msg ops '.get_config' in the driver under 
'DPDK_SRC/drivers/vdpa/' , qemu can use 'vhost_user_get_config' to send 
vhost msg to calls the dpdk vdpa vendor driver's ops 'get_config' to 
obtain the mac address information of the vdpa device. In this way, even 
if the mac address of the network device parameters configured by the 
user for qemu vhost user is inconsistent with the mac address of the 
vdpa hardware, qemu can be corrected to be consistent with the mac 
address of the vdpa hardware.

When vhost-user interface is used by dpdk-vdpa & qemu, 
'vhost_user_get_config' will get the vdpa device's mac address if dpdk 
vdpa vendor driver implement 'get_config',otherwise, it won't do anything.

When vhost-user interface is used by dpdk vhost-user, it won't do anything.

I think the functions provided by the VHOST_USER_PROTOCOL_F_CONFIG 
feature can be available separately, but the check here caused 
VHOST_USER_PROTOCOL_F_CONFIG feature is cleared, which will cause 
vhost_user_get_config is not working properly in virtio-net at 
hw/net/virtio_net.c.

Maybe the check here should be moved other side?
The new patch v2 has been sent, please reply there.

> >>if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
>
> >> -bool supports_f_config = vus->supports_config ||
>
> >> -(dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
>
> >>uint64_t protocol_features;
>
> >>
>
> >>dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>
> >> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>
> >> */
>
> >>protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
>
> >>
>
> >> -if (supports_f_config) {
>
> >> -if (!virtio_has_feature(protocol_features,
>
> >> -VHOST_USER_PROTOCOL_F_CONFIG)) {
>
> >> -error_setg(errp, "vhost-user device expecting "
>
> >> - "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
>
> >> - "not support it.");
>
> >> -return -EPROTO;
>
> >> -}
>
> >> -} else {
>
> >> -if (virtio_has_feature(protocol_features,
>
> >> - VHOST_USER_PROTOCOL_F_CONFIG)) {
>
> >> -warn_reportf_err(*errp, "vhost-user backend supports "
>
> >> - "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
>
> >> -protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
>
> >> -}
>
> >> -}
>
> >> -
>
> >>/* final set of protocol features */
>
> >>dev->protocol_features = protocol_features;
>
> >>err = vhost_user_set_protocol_features(dev, dev->protocol_features);
>
> >> --
>
> >> 2.27.0
>
> >>
>
> >
>
--------------frsk7wFSv6ax0upyqPZuM3Ej
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/9/21 13:28, Raphael Norwitz 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9@BL3PR02MB7938.namprd02.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0in;
	font-size:8.5pt;
	font-family:Menlo;
	color:black;}span.s1
	{mso-style-name:s1;}span.apple-converted-space
	{mso-style-name:apple-converted-space;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style>
      <div class="WordSection1">
        <div>
          <p class="p1"><span class="s1">I have some concerns from the
              vhost-user-blk side.<o:p></o:p></span></p>
          <p class="p1"><span class="s1"><o:p> </o:p></span></p>
          <p class="p1"><span class="s1">&gt;On Tue, Sep 13, 2022 at
              5:13 PM Hao Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenh@yusur.tech">&lt;chenh@yusur.tech&gt;</a> wrote:</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt; When use dpdk-vdpa
              tests vdpa device. You need to specify the mac address to</span></p>
          <p class="p1"><span class="s1">&gt;&gt; start the virtual
              machine through libvirt or qemu, but now, the libvirt or</span></p>
          <p class="p1"><span class="s1">&gt;&gt; qemu can call dpdk
              vdpa vendor driver's ops .get_config through
              vhost_net_get_config</span></p>
          <p class="p1"><span class="s1">&gt;&gt; to get the mac address
              of the vdpa hardware without manual configuration.</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt; Signed-off-by: Hao
              Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenh@yusur.tech">&lt;chenh@yusur.tech&gt;</a></span></p>
          <p class="p1"><span class="s1">&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;Adding Cindy for comments.</span></p>
          <p class="p1"><span class="s1">&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;Thanks</span></p>
          <p class="p1"><span class="s1">&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt; ---</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">  </span>
            <span class="s1">hw/block/vhost-user-blk.c |</span><span
              class="apple-converted-space"> 
            </span><span class="s1">1 -</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">  </span>
            <span class="s1">hw/net/virtio-net.c </span><span
              class="apple-converted-space">     
            </span><span class="s1">|</span><span
              class="apple-converted-space">  </span><span class="s1">3
              ++-</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">  </span>
            <span class="s1">hw/virtio/vhost-user.c</span><span
              class="apple-converted-space">   
            </span><span class="s1">| 19 -------------------</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">  </span>
            <span class="s1">3 files changed, 2 insertions(+), 21
              deletions(-)</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt; diff --git
              a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; index
              9117222456..5dca4eab09 100644</span></p>
          <p class="p1"><span class="s1">&gt;&gt; ---
              a/hw/block/vhost-user-blk.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; +++
              b/hw/block/vhost-user-blk.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; @@ -337,7 +337,6 @@
              static int vhost_user_blk_connect(DeviceState *dev, Error
              **errp)</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">     
            </span><span class="s1">vhost_dev_set_config_notifier(&amp;s-&gt;dev,
              &amp;blk_ops);</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">   
            </span><span class="s1">s-&gt;vhost_user.supports_config =
              true;<o:p></o:p></span></p>
          <p class="p1"><span class="s1"><o:p> </o:p></span></p>
          <p class="p1"><span class="s1">vhost-user-blk requires the
              backend to support VHOST_USER_PROTOCOL_F_CONFIG<o:p></o:p></span></p>
          <p class="p1"><span class="s1">and vhost_user.supports_config
              is used to enforce that.<o:p></o:p></span></p>
          <p class="p1"><span class="s1"><o:p> </o:p></span></p>
          <p class="p1"><span class="s1">Why are you removing it here?<o:p></o:p></span></p>
          <p class="p1"><span class="s1"><o:p> </o:p></span></p>
          <p class="p1"><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">     
            </span><span class="s1">ret = vhost_dev_init(&amp;s-&gt;dev,
              &amp;s-&gt;vhost_user, VHOST_BACKEND_TYPE_USER, 0,</span></p>
          <p class="p1"><span class="s1">&gt;&gt; </span><span
              class="apple-converted-space">                         
            </span><span class="s1">errp);</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">     
            </span><span class="s1">if (ret &lt; 0) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; diff --git
              a/hw/net/virtio-net.c b/hw/net/virtio-net.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; index
              dd0d056fde..274ea84644 100644</span></p>
          <p class="p1"><span class="s1">&gt;&gt; ---
              a/hw/net/virtio-net.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; +++
              b/hw/net/virtio-net.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; @@ -149,7 +149,8 @@
              static void virtio_net_get_config(VirtIODevice *vdev,
              uint8_t *config)</span></p>
          <p class="p1"><span class="s1">&gt;&gt; </span><span
              class="apple-converted-space">     
            </span><span class="s1">* Is this VDPA? No peer means not
              VDPA: there's no way to</span></p>
          <p class="p1"><span class="s1">&gt;&gt; </span><span
              class="apple-converted-space">     
            </span><span class="s1">* disconnect/reconnect a VDPA peer.</span></p>
          <p class="p1"><span class="s1">&gt;&gt; </span><span
              class="apple-converted-space">     
            </span><span class="s1">*/</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">   
            </span><span class="s1">if (nc-&gt;peer &amp;&amp;
              nc-&gt;peer-&gt;info-&gt;type ==
              NET_CLIENT_DRIVER_VHOST_VDPA) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; +</span><span
              class="apple-converted-space">   
            </span><span class="s1">if ((nc-&gt;peer &amp;&amp;
              nc-&gt;peer-&gt;info-&gt;type ==
              NET_CLIENT_DRIVER_VHOST_VDPA) ||</span></p>
          <p class="p1"><span class="s1">&gt;&gt; +</span><span
              class="apple-converted-space">       
            </span><span class="s1">(nc-&gt;peer &amp;&amp;
              nc-&gt;peer-&gt;info-&gt;type ==
              NET_CLIENT_DRIVER_VHOST_USER)) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">ret =
              vhost_net_get_config(get_vhost_net(nc-&gt;peer), (uint8_t
              *)&amp;netcfg,</span></p>
          <p class="p1"><span class="s1">&gt;&gt; </span><span
              class="apple-converted-space">                           
                     
            </span><span class="s1">n-&gt;config_size);</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">if (ret != -1) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; diff --git
              a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; index
              bd24741be8..8b01078249 100644</span></p>
          <p class="p1"><span class="s1">&gt;&gt; ---
              a/hw/virtio/vhost-user.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; +++
              b/hw/virtio/vhost-user.c</span></p>
          <p class="p1"><span class="s1">&gt;&gt; @@ -2013,8 +2013,6 @@
              static int vhost_user_backend_init(struct vhost_dev *dev,
              void *opaque,</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">     
            </span><span class="s1">}</span></p>
          <p class="p1"><span class="s1">&gt;&gt;<o:p> </o:p></span></p>
          <p class="p1"><span class="s1"><o:p> </o:p></span></p>
          <p class="p1"><span class="s1">Why are you removing this? Can
              you expand on how it helps dpdk-vdpa.</span></p>
        </div>
      </div>
    </blockquote>
    <p>I implemented a function by modifying these places in the patch,
      and then implementing vhost msg ops '.get_config' in the driver
      under 'DPDK_SRC/drivers/vdpa/' , qemu can use
      'vhost_user_get_config' to send vhost msg to calls the dpdk vdpa
      vendor driver's ops 'get_config' to obtain the mac address
      information of the vdpa device. In this way, even if the mac
      address of the network device parameters configured by the user
      for qemu vhost user is inconsistent with the mac address of the
      vdpa hardware, qemu can be corrected to be consistent with the mac
      address of the vdpa hardware.</p>
    <p>When vhost-user interface is used by dpdk-vdpa &amp; qemu,
      'vhost_user_get_config' will get the vdpa device's mac address if
      dpdk vdpa vendor driver implement 'get_config',otherwise, it won't
      do anything.</p>
    <p>When vhost-user interface is used by dpdk vhost-user, it won't do
      anything. </p>
    <p>I think the functions provided by the
      VHOST_USER_PROTOCOL_F_CONFIG feature can be available separately,
      but the check here caused VHOST_USER_PROTOCOL_F_CONFIG feature is
      cleared, which will cause vhost_user_get_config is not working
      properly in virtio-net at hw/net/virtio_net.c.<br>
      <br>
      Maybe the check here should be moved other side?<br>
      The new patch v2 has been sent, please reply there.<br>
    </p>
    <blockquote type="cite"
cite="mid:BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9@BL3PR02MB7938.namprd02.prod.outlook.com">
      <div class="WordSection1">
        <div>
          <p class="p1"><span class="s1"><o:p></o:p></span></p>
          <p class="p1"><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">     
            </span><span class="s1">if (virtio_has_feature(features,
              VHOST_USER_F_PROTOCOL_FEATURES)) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">       
            </span><span class="s1">bool supports_f_config =
              vus-&gt;supports_config ||</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">           
            </span><span class="s1">(dev-&gt;config_ops &amp;&amp;
              dev-&gt;config_ops-&gt;vhost_dev_config_notifier);</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">uint64_t protocol_features;</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">dev-&gt;backend_features |= 1ULL
              &lt;&lt; VHOST_USER_F_PROTOCOL_FEATURES;</span></p>
          <p class="p1"><span class="s1">&gt;&gt; @@ -2033,23 +2031,6 @@
              static int vhost_user_backend_init(struct vhost_dev *dev,
              void *opaque,</span></p>
          <p class="p1"><span class="s1">&gt;&gt; </span><span
              class="apple-converted-space">         
            </span><span class="s1">*/</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">protocol_features &amp;=
              VHOST_USER_PROTOCOL_FEATURE_MASK;</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">       
            </span><span class="s1">if (supports_f_config) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">           
            </span><span class="s1">if
              (!virtio_has_feature(protocol_features,</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">                           
                     
            </span><span class="s1">VHOST_USER_PROTOCOL_F_CONFIG)) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">               
            </span><span class="s1">error_setg(errp, "vhost-user device
              expecting "</span></p>
          <p class="p1"><span class="s1">&gt;&gt; - </span><span
              class="apple-converted-space">                         
            </span><span class="s1">"VHOST_USER_PROTOCOL_F_CONFIG but
              the vhost-user backend does "</span></p>
          <p class="p1"><span class="s1">&gt;&gt; - </span><span
              class="apple-converted-space">                         
            </span><span class="s1">"not support it.");</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">               
            </span><span class="s1">return -EPROTO;</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">           
            </span><span class="s1">}</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">       
            </span><span class="s1">} else {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">           
            </span><span class="s1">if
              (virtio_has_feature(protocol_features,</span></p>
          <p class="p1"><span class="s1">&gt;&gt; - </span><span
              class="apple-converted-space">                           
                   
            </span><span class="s1">VHOST_USER_PROTOCOL_F_CONFIG)) {</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">               
            </span><span class="s1">warn_reportf_err(*errp, "vhost-user
              backend supports "</span></p>
          <p class="p1"><span class="s1">&gt;&gt; - </span><span
              class="apple-converted-space">                           
                 
            </span><span class="s1">"VHOST_USER_PROTOCOL_F_CONFIG but
              QEMU does not.");</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">               
            </span><span class="s1">protocol_features &amp;= ~(1ULL
              &lt;&lt; VHOST_USER_PROTOCOL_F_CONFIG);</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">           
            </span><span class="s1">}</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span><span
              class="apple-converted-space">       
            </span><span class="s1">}</span></p>
          <p class="p1"><span class="s1">&gt;&gt; -</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">/* final set of protocol features */</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">dev-&gt;protocol_features =
              protocol_features;</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><span
              class="apple-converted-space">         
            </span><span class="s1">err =
              vhost_user_set_protocol_features(dev,
              dev-&gt;protocol_features);</span></p>
          <p class="p1"><span class="s1">&gt;&gt; --</span></p>
          <p class="p1"><span class="s1">&gt;&gt; 2.27.0</span></p>
          <p class="p1"><span class="s1">&gt;&gt;</span><o:p> </o:p></p>
          <p class="p1"><span class="s1">&gt;</span><o:p> </o:p></p>
          <p class="MsoNormal" style="margin-bottom:12.0pt"><span
              style="font-size:11.0pt"><o:p> </o:p></span></p>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------frsk7wFSv6ax0upyqPZuM3Ej--

